# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).

user = User.create(email: 'demo@phylator.com', password: 'password')
user&.encrypted_password

Fetch::Category.new.perform
Fetch::Pack.new.perform
Fetch::Quantity.new.perform
Fetch::UnitOfMeasurement.new.perform
Fetch::Constant.new.perform
Fetch::Equation.new.perform

# Algolia
Pack.reindex
Quantity.reindex
Constant.reindex
