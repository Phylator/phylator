# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# Demo
user = User.create email: 'demo@phylator.com', password: 'password'
user&.encrypted_password




# Categories
categories = JSON.parse File.read('../data/categories.json')
categories.each do |category|
    locals = category.delete 'locals'
    category = Category.find_or_create_by! category
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        category.update_attributes translation
    end
end


# Packs
packs = JSON.parse File.read('../data/packs.json')
packs.each do |pack|
    locals = pack.delete 'locals'
    pack[:category] = Category.find_by name: pack.delete('category')
    pack = Pack.find_or_create_by! pack
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        pack.update_attributes translation
    end
end


# Quantities
quantities = JSON.parse File.read('../data/quantities.json')
quantities.each do |quantity|
    locals = quantity.delete 'locals'
    quantity[:pack] = Pack.find_by name: quantity.delete('pack'), category: quantity.delete('category')
    quantity[:parent_quantity] = Quantity.find_by name: quantity.delete('parent_quantity')
    quantity = Quantity.find_or_create_by! quantity
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        quantity.update_attributes translation
    end
end


# Constants
constants = JSON.parse File.read('../data/constants.json')
constants.each do |constant|
    locals = constant.delete 'locals'
    constant[:pack] = Pack.find_by name: constant.delete('pack'), category: constant.delete('category')
    constant[:unit_of_measurement] = UnitOfMeasurement.find_by name: constant.delete('unit')
    value = constant.delete('value')
    constant = Constant.find_or_create_by! constant
    constant.set_value = value
    constant.save!
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        constant.update_attributes translation
    end
end


# Units
units = JSON.parse File.read('../data/units.json')
units.each do |unit|
    locals = unit.delete 'locals'
    quantites = unit.delete('quantites')
    unit = UnitOfMeasurement.find_or_create_by! unit
    quantites.each do |quantity|
        quantity = Quantity.find_by name: quantity
        unit.unit_of_measurement_quantities.find_or_create_by! quantity: quantity
    end
    locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        unit.update_attributes translation
    end
end


# Equations
equations = JSON.parse File.read('../data/equations.json')
equations.each do |data|
    quantity = Quantity.find_by name: data['quantity']
    data['equations'].each do |equation|
        equation[:quantity] = quantity
        equation = Equation.find_or_create_by! equation
    end
end




# Algolia
Quantity.reindex
Constant.reindex
Pack.reindex
