# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

quantity = Quantity.create! symbol: 't', name: 'Time', description: 'test test test'
unit_of_measurement = UnitOfMeasurement.create! quantity: quantity, symbol: 's', name: 'Seconds', exchange_rate: '1', base: true
