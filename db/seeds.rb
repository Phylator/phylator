# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).



I18n.locale = 'en'


# Length
length = Quantity.find_or_create_by! symbol: 'l', name: 'Length', description: 'The one-dimensional extent of an object'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'm', name: 'meter'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'km', name: 'kilometer', to_base: '*1000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'dm', name: 'dezimeter', to_base: '/10'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'cm', name: 'centimeter', to_base: '/100'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'µm', name: 'micrometer', to_base: '/1000000'

# Mass
mass = Quantity.find_or_create_by! symbol: 'm', name: 'Mass', description: 'A measure of resistance to acceleration'
mass_measurement = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'kg', name: 'kilogram'

# Time
time = Quantity.find_or_create_by! symbol: 't', name: 'Time', description: 'The duration of an event'
time_measurement = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 's', name: 'second'

# Electric current
electric_current = Quantity.find_or_create_by! symbol: 'I', name: 'Electric current', description: 'Rate of flow of electrical charge per unit time'
electric_current_measurement = UnitOfMeasurement.find_or_create_by! quantity: electric_current, symbol: 'A', name: 'ampere'

# Temperature
temperature = Quantity.find_or_create_by! symbol: 'T', name: 'Temperature', description: 'Average kinetic energy per degree of freedom of a system'
temperature_measurement = UnitOfMeasurement.find_or_create_by! quantity: temperature, symbol: 'K', name: 'kelvin'

# Amount of substance
amount_of_substance = Quantity.find_or_create_by! symbol: 'n', name: 'Amount of substance', description: 'Number of particles compared to the number of atoms in 0.012 kg of 12C'
amount_of_substance_measurement = UnitOfMeasurement.find_or_create_by! quantity: amount_of_substance, symbol: 'mol', name: 'mole'

# Luminous intensity
luminous_intensity = Quantity.find_or_create_by! symbol: 'L', name: 'Luminous intensity', description: 'Wavelength-weighted power of emitted light per unit solid angle'
luminous_intensity_measurement = UnitOfMeasurement.find_or_create_by! quantity: luminous_intensity, symbol: 'cd', name: 'candela'


# Absement
absement = Quantity.find_or_create_by! symbol: 'A', name: 'Absement', description: 'Measure of sustained displacement: the first integral of displacement', vector: true
absement_measurement = UnitOfMeasurement.find_or_create_by! quantity: absement, symbol: 'm×s'

# Acceleration
acceleration = Quantity.find_or_create_by! symbol: 'a', name: 'Acceleration', description: 'Change of the speed or velocity per unit time', vector: true
acceleration_measurement = UnitOfMeasurement.find_or_create_by! quantity: acceleration, symbol: 'm×s⁻²'





# Equations

## Length
Equation.find_or_create_by! quantity: length, equation: 'm*t'
