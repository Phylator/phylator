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
    pack[:category] = Category.find_by name: pack.delete('category')
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
units.each do |unit|
    locals = unit.delete 'locals'
    quantities = unit.delete 'quantities'
    u = UnitOfMeasurement.find_by name: unit['name']
    if u.nil?
        u = UnitOfMeasurement.create! unit
    else
        u.update! unit
    end
    quantities&.each do |quantity|
        u.unit_of_measurement_quantities.find_or_create_by! quantity: Quantity.find_by(name: quantity)
    end
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        u.update_attributes translation
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
    data['equations'].each do |equation|
        equation = {
            equation: equation,
            quantity: quantity
        }
        e = Equation.find_by equation: equation[:equation], quantity: equation[:quantity]
        if e.nil?
            e = Equation.create! equation
        else
            e.update! equation
        end
    end
end




# Algolia
Pack.reindex
Quantity.reindex
Constant.reindex
