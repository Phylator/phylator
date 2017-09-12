# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).



I18n.locale = 'en'


# Length
length = Quantity.find_or_create_by! symbol: 'l', name: 'Length', description: 'The one-dimensional extent of an object'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'm', name: 'meter'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Em', name: 'exameter', to_base: '*1000000000000000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Pm', name: 'petameter', to_base: '*1000000000000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Tm', name: 'terameter', to_base: '*1000000000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Gm', name: 'gigameter', to_base: '*1000000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Mm', name: 'megameter', to_base: '*1000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'km', name: 'kilometer', to_base: '*1000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'hm', name: 'hectometer', to_base: '*100'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'dam', name: 'decameter', to_base: '*10'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'dm', name: 'decimeter', to_base: '/10'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'cm', name: 'centimeter', to_base: '/100'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'mm', name: 'milimeter', to_base: '/1000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'µm', name: 'micrometer', to_base: '/1000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'nm', name: 'nanometer', to_base: '/1000000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'pm', name: 'picometer', to_base: '/1000000000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'fm', name: 'femtometer', to_base: '/1000000000000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'am', name: 'attometer', to_base: '/1000000000000000000'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'in', name: 'Inch', to_base: '/0.254'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'ft', name: 'Foot', to_base: '/3.048'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'yd', name: 'Yard', to_base: '/9.144'
UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'mi', name: 'Miles', to_base: '/16093.44'

# Mass
mass = Quantity.find_or_create_by! symbol: 'm', name: 'Mass', description: 'A measure of resistance to acceleration'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'kg', name: 'kilogram'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Eg', name: 'exagram', to_base: '*1000000000000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Pg', name: 'petagram', to_base: '*1000000000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Tg', name: 'teragram', to_base: '*1000000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Gg', name: 'gigagram', to_base: '*1000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Mg', name: 'megagram', to_base: '*1000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'hg', name: 'hectogram', to_base: '/10'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'dag', name: 'decagram', to_base: '/100'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'g', name: 'gram', to_base: '/1000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'dg', name: 'decigram', to_base: '/10000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'cg', name: 'centigram', to_base: '/100000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'mg', name: 'miligram', to_base: '/1000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'µg', name: 'microgram', to_base: '/1000000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'ng', name: 'nanogram', to_base: '/10000000000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'pg', name: 'picogram', to_base: '/1000000000000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'fg', name: 'femtogram', to_base: '/1000000000000000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'ag', name: 'attogram', to_base: '/1000000000000000000000'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'u', name: 'atomic mass', to_base: '/0.000000000000000000000000166054'
UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'lbs', name: 'pound', to_base: '/4.53592'

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




# Translations

I18n.locale = 'de'

## Length
length = Quantity.find_or_create_by! symbol: 'l', name: 'Strecke', description: 'Die eindimensionale Ausdehnung eines Gegenstandes'
UnitOfMeasurement.find_or_create_by! symbol: 'm', name: 'Meter'
UnitOfMeasurement.find_or_create_by! symbol: 'Em', name: 'Exameter'
UnitOfMeasurement.find_or_create_by! symbol: 'Pm', name: 'Petameter'
UnitOfMeasurement.find_or_create_by! symbol: 'Tm', name: 'Terameter'
UnitOfMeasurement.find_or_create_by! symbol: 'Gm', name: 'Gigameter'
UnitOfMeasurement.find_or_create_by! symbol: 'Mm', name: 'Megameter'
UnitOfMeasurement.find_or_create_by! symbol: 'km', name: 'Kilometer'
UnitOfMeasurement.find_or_create_by! symbol: 'hm', name: 'Hektometer'
UnitOfMeasurement.find_or_create_by! symbol: 'dam', name: 'Dekameter'
UnitOfMeasurement.find_or_create_by! symbol: 'dm', name: 'Dezimeter'
UnitOfMeasurement.find_or_create_by! symbol: 'cm', name: 'Zentimeter'
UnitOfMeasurement.find_or_create_by! symbol: 'mm', name: 'Milimeter'
UnitOfMeasurement.find_or_create_by! symbol: 'µm', name: 'Micrometer'
UnitOfMeasurement.find_or_create_by! symbol: 'nm', name: 'Nanometer'
UnitOfMeasurement.find_or_create_by! symbol: 'pm', name: 'Pikometer'
UnitOfMeasurement.find_or_create_by! symbol: 'fm', name: 'Femtometer'
UnitOfMeasurement.find_or_create_by! symbol: 'am', name: 'Attometer'
UnitOfMeasurement.find_or_create_by! symbol: 'in', name: 'Inch'
UnitOfMeasurement.find_or_create_by! symbol: 'ft', name: 'Foot'
UnitOfMeasurement.find_or_create_by! symbol: 'yd', name: 'Yard'
UnitOfMeasurement.find_or_create_by! symbol: 'mi', name: 'Miles'

## Mass
mass = Quantity.find_or_create_by! symbol: 'm', name: 'Masse', description: 'Ein Maß für Widerstand gegen Beschleunigung'
UnitOfMeasurement.find_or_create_by! symbol: 'kg', name: 'Kilogramm'
UnitOfMeasurement.find_or_create_by! symbol: 'Eg', name: 'Exagramm'
UnitOfMeasurement.find_or_create_by! symbol: 'Pg', name: 'Petagramm'
UnitOfMeasurement.find_or_create_by! symbol: 'Tg', name: 'Teragramm'
UnitOfMeasurement.find_or_create_by! symbol: 'Gg', name: 'Gigagramm'
UnitOfMeasurement.find_or_create_by! symbol: 'Mg', name: 'Megagramm'
UnitOfMeasurement.find_or_create_by! symbol: 'hg', name: 'Hektogramm'
UnitOfMeasurement.find_or_create_by! symbol: 'dag', name: 'Dekagramm'
UnitOfMeasurement.find_or_create_by! symbol: 'g', name: 'Gramm'
UnitOfMeasurement.find_or_create_by! symbol: 'dg', name: 'Dezigramm'
UnitOfMeasurement.find_or_create_by! symbol: 'cg', name: 'Zentigramm'
UnitOfMeasurement.find_or_create_by! symbol: 'mg', name: 'Miligramm'
UnitOfMeasurement.find_or_create_by! symbol: 'µg', name: 'Mikrogramm'
UnitOfMeasurement.find_or_create_by! symbol: 'ng', name: 'Nanogramm'
UnitOfMeasurement.find_or_create_by! symbol: 'pg', name: 'Pikogramm'
UnitOfMeasurement.find_or_create_by! symbol: 'fg', name: 'Femtogramm'
UnitOfMeasurement.find_or_create_by! symbol: 'ag', name: 'Attogramm'
UnitOfMeasurement.find_or_create_by! symbol: 'u', name: 'Atomare Masse'
UnitOfMeasurement.find_or_create_by! symbol: 'lbs', name: 'Pfund'
