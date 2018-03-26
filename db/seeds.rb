# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# Demo
user = User.create email: 'demo@phylator.com', password: 'password'
user&.encrypted_password




# Categories
categories = JSON.parse File.read('data/categories.json')
categories.each do |category|
    locals = category.delete 'locals'
    c = Category.find_by name: category['name']
    if c.nil?
        c = Category.create! category
    else
        c.update! category
    end
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        c.update_attributes translation
    end
end


# Packs
packs = JSON.parse File.read('data/packs.json')
packs.each do |pack|
    locals = pack.delete 'locals'
    pack['category'] = Category.find_by name: pack.delete('category')
    pa = Pack.find_by name: pack['name'], category: pack['category']
    if pa.nil?
        pa = Pack.create! pack
    else
        pa.update! pack
    end
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        pa.update_attributes translation
    end
end


# Quantities
quantities = JSON.parse File.read('data/quantities.json')
quantities.each do |quantity|
    locals = quantity.delete 'locals'
    category = Category.find_by name: quantity.delete('category')
    quantity[:pack] = Pack.find_by name: quantity.delete('pack'), category: category
    quantity[:parent_quantity] = Quantity.find_by name: quantity.delete('parent_quantity')
    q = Quantity.find_by name: quantity['name']
    if q.nil?
        q = Quantity.create! quantity
    else
        q.update! quantity
    end
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        q.update_attributes translation
    end
end


# Units
units = JSON.parse File.read('data/units.json')
si_prefixes = JSON.parse File.read('data/si_prefixes.json')
units.each do |unit|
    locals = unit.delete 'locals'
    quantities = unit.delete 'quantities'
    si_prefix = unit.delete 'si_prefixes?'
    base_symbol = unit.delete 'base_symbol'
    base_name = unit.delete 'base_name'
    u = UnitOfMeasurement.find_by name: unit['name']
    if u.nil?
        begin
            u = UnitOfMeasurement.create! unit
        rescue ActiveRecord::RecordInvalid
            raise [unit['symbol'], unit['name']].inspect
        end
    else
        u.update! unit
    end
    quantities&.each do |quantity|
        u.add_to_belonger! Quantity.find_by(name: quantity)
    end
    locals.each do |locale, translation|
        base_name = translation.delete 'base_name'
        translation[:locale] = locale.to_sym
        u.update_attributes translation
        translation['base_name'] = base_name
    end
    unless si_prefix == false
        si_prefixes.each do |si_prefix|
            prefixed_unit = unit.dup
            prefixed_unit['base'] = false
            prefixed_unit['si'] = u
            prefixed_unit['symbol'] = si_prefix['symbol'] + ( base_symbol || prefixed_unit['symbol'] )
            name = base_name&.downcase || prefixed_unit['name'].downcase
            prefixed_unit['name'] = si_prefix['name'] + (name.include?(' ') ? ' ' : '') + name
            if prefixed_unit['base'] == false
                prefixed_unit['to_base'] = "*(1#{prefixed_unit['to_base']})#{si_prefix['to_base']}"
            else
                prefixed_unit['to_base'] = si_prefix['to_base']
            end
            u = UnitOfMeasurement.find_by name: prefixed_unit['name']
            if u.nil?
                begin
                    u = UnitOfMeasurement.create! prefixed_unit
                rescue ActiveRecord::RecordInvalid
                    raise [prefixed_unit['symbol'], prefixed_unit['name'], prefixed_unit['to_base']].inspect
                end
            else
                u.update! prefixed_unit
            end
            quantities&.each do |quantity|
                u.add_to_belonger! Quantity.find_by(name: quantity)
            end
            locals.each do |locale, translation|
                base_name = translation.delete 'base_name'
                translation['name'] = si_prefix.dig('locals', locale, 'name') + ( base_name&.downcase || translation['name'].downcase ).downcase
                translation[:locale] = locale.to_sym
                u.update_attributes translation
            end
        end
    end
end


# Constants
constants = JSON.parse File.read('data/constants.json')
constants.each do |constant|
    locals = constant.delete 'locals'
    category = Category.find_by name: constant.delete('category')
    constant[:pack] = Pack.find_by name: constant.delete('pack'), category: category
    constant[:unit_of_measurement] = UnitOfMeasurement.find_by name: constant.delete('unit')
    value = constant.delete('value')
    c = Constant.find_by name: constant['name']
    if c.nil?
        c = Constant.create! constant
    else
        c.update! constant
    end
    c.set_value = value
    c.save!
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        c.update_attributes translation
    end
end


# Equations
equations = JSON.parse File.read('data/equations.json')
equations.each do |data|
    quantity = Quantity.find_by name: data['quantity']
    data['categories'].each do |category_data|
        title = category_data['title']
        category_data['equations'].each do |equation|
            locals = equation.delete 'locals'
            equation = {
                equation: equation['equation'],
                title: title,
                conditions: equation['conditions'],
                quantity: quantity
            }
            e = Equation.find_by equation: equation[:equation], quantity: equation[:quantity]
            if e.nil?
                e = Equation.create! equation
            else
                e.update! equation
            end
            category_data['locals'].each do |locale, translation|
                translation[:locale] = locale.to_sym
                translation[:conditions] = locals&.dig(locale, 'conditions')
                e.update_attributes translation
            end
        end
    end
end




# Algolia
Pack.reindex
Quantity.reindex
Constant.reindex
