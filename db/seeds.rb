# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).



I18n.locale = 'en'


# Length
length = Quantity.create! symbol: 'l', name: 'Length', description: 'The one-dimensional extent of an object'
length_measurement = UnitOfMeasurement.create! quantity: length, symbol: 'm', name: 'metre', base: true
length_measurement = UnitOfMeasurement.create! quantity: length, symbol: 'km', exchange_rate: 'd1000'
length_measurement = UnitOfMeasurement.create! quantity: length, symbol: 'dm', exchange_rate: 'm10'
length_measurement = UnitOfMeasurement.create! quantity: length, symbol: 'cm', exchange_rate: 'm100'
length_measurement = UnitOfMeasurement.create! quantity: length, symbol: 'µm', exchange_rate: 'm1000000'

# Mass
mass = Quantity.create! symbol: 'm', name: 'Mass', description: 'A measure of resistance to acceleration'
mass_measurement = UnitOfMeasurement.create! quantity: mass, symbol: 'kg', name: 'kilogram', base: true

# Time
time = Quantity.create! symbol: 't', name: 'Time', description: 'The duration of an event'
time_measurement = UnitOfMeasurement.create! quantity: time, symbol: 's', name: 'second', base: true

# Electric current
electric_current = Quantity.create! symbol: 'I', name: 'Electric current', description: 'Rate of flow of electrical charge per unit time'
electric_current_measurement = UnitOfMeasurement.create! quantity: electric_current, symbol: 'A', name: 'ampere', base: true

# Temperature
temperature = Quantity.create! symbol: 'T', name: 'Temperature', description: 'Average kinetic energy per degree of freedom of a system'
temperature_measurement = UnitOfMeasurement.create! quantity: temperature, symbol: 'K', name: 'kelvin', base: true

# Amount of substance
amount_of_substance = Quantity.create! symbol: 'n', name: 'Amount of substance', description: 'Number of particles compared to the number of atoms in 0.012 kg of 12C'
amount_of_substance_measurement = UnitOfMeasurement.create! quantity: amount_of_substance, symbol: 'mol', name: 'mole', base: true

# Luminous intensity
luminous_intensity = Quantity.create! symbol: 'L', name: 'Luminous intensity', description: 'Wavelength-weighted power of emitted light per unit solid angle'
luminous_intensity_measurement = UnitOfMeasurement.create! quantity: luminous_intensity, symbol: 'cd', name: 'candela', base: true


# Absement
absement = Quantity.create! symbol: 'A', name: 'Absement', description: 'Measure of sustained displacement: the first integral of displacement'
absement_measurement = UnitOfMeasurement.create! quantity: absement, symbol: 'm×s', base: true

# Acceleration
acceleration = Quantity.create! symbol: 'a', name: 'Acceleration', description: 'Change of the speed or velocity per unit time'
acceleration_measurement = UnitOfMeasurement.create! quantity: acceleration, symbol: 'm×s⁻²', base: true
