# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).

user = User.create email: 'demo@phylator.com', password: 'password'
user&.encrypted_password

Fetch::Category.new.perform
Fetch::Pack.new.perform
Fetch::Quantity.new.perform

# Units
units = JSON.parse File.read('data/units.json')
si_prefixes = JSON.parse File.read('data/si_prefixes.json')
units.each do |unit|
  locals = unit.delete 'locals'
  quantities = unit.delete 'quantities'
  has_si_prefix = unit.delete 'si_prefixes?'
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
    quantity = Quantity.find_by(name: quantity)
    u.add_to_belonger! quantity unless u.quantities.include?(quantity)
  end
  locals.each do |locale, translation|
    local_base_name = translation.delete 'base_name'
    translation[:locale] = locale.to_sym
    u.update_attributes translation
    translation['base_name'] = local_base_name
  end
  base_unit = u

  next unless has_si_prefix
  si_prefixes.each do |si_prefix|
    prefixed_unit = unit.dup
    prefixed_unit['base'] = false
    prefixed_unit['si'] = base_unit
    prefixed_unit['symbol'] =
      si_prefix['symbol'] + (base_symbol || prefixed_unit['symbol'])
    name = base_name&.downcase || prefixed_unit['name'].downcase
    prefixed_unit['name'] =
      si_prefix['name'] + (name.include?(' ') ? ' ' : '') + name
    if prefixed_unit['base'] == false
      prefixed_unit['to_base'] =
        "*(1#{prefixed_unit['to_base']})#{si_prefix['to_base']}"
    else
      prefixed_unit['to_base'] = si_prefix['to_base']
    end
    u = UnitOfMeasurement.find_by name: prefixed_unit['name']
    if u.nil?
      begin
        u = UnitOfMeasurement.create! prefixed_unit
      rescue ActiveRecord::RecordInvalid
        raise [prefixed_unit['symbol'], prefixed_unit['name'],
               prefixed_unit['to_base']].inspect
      end
    else
      u.update! prefixed_unit
    end
    quantities&.each do |quantity|
      quantity = Quantity.find_by(name: quantity)
      u.add_to_belonger! quantity unless u.quantities.include?(quantity)
    end
    locals.each do |locale, translation|
      local_base_name = translation.delete 'base_name'
      local_name = local_base_name&.downcase || translation['name'].downcase
      translation['name'] = si_prefix.dig('locals', locale, 'name') +
                            (local_name.include?(' ') ? ' ' : '') + local_name
      translation[:locale] = locale.to_sym
      u.update_attributes translation
    end
  end
end

# Constants
constants = JSON.parse File.read('data/constants.json')
constants.each do |constant|
  locals = constant.delete 'locals'
  category = Category.find_by name: constant.delete('category')
  constant[:pack] = Pack.find_by name: constant.delete('pack'),
                                 category: category
  constant[:unit_of_measurement] =
    UnitOfMeasurement.find_by name: constant.delete('unit')
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
      e = Equation.find_by equation: equation[:equation],
                           quantity: equation[:quantity]
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
