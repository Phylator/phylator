# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).



# Length
length = Quantity.find_or_create_by! symbol: 'l', name: 'Length', description: 'The one-dimensional extent of an object'
length_meter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'm', name: 'meter'
length_exameter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Em', name: 'exameter', to_base: '*1000000000000000000'
length_petameter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Pm', name: 'petameter', to_base: '*1000000000000000'
length_terameter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Tm', name: 'terameter', to_base: '*1000000000000'
length_gigameter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Gm', name: 'gigameter', to_base: '*1000000000'
length_megameter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'Mm', name: 'megameter', to_base: '*1000000'
length_kilometer = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'km', name: 'kilometer', to_base: '*1000'
length_hectometer = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'hm', name: 'hectometer', to_base: '*100'
length_decameter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'dam', name: 'decameter', to_base: '*10'
length_decimeter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'dm', name: 'decimeter', to_base: '/10'
length_centimeter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'cm', name: 'centimeter', to_base: '/100'
length_milimeter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'mm', name: 'milimeter', to_base: '/1000'
length_micrometer = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'µm', name: 'micrometer', to_base: '/1000000'
length_nanometer = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'nm', name: 'nanometer', to_base: '/1000000000'
length_picometer = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'pm', name: 'picometer', to_base: '/1000000000000'
length_femtometer = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'fm', name: 'femtometer', to_base: '/1000000000000000'
length_attometer = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'am', name: 'attometer', to_base: '/1000000000000000000'
length_inch = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'in', name: 'inch', to_base: '/0.254'
length_foot = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'ft', name: 'foot', to_base: '/3.048'
length_yard = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'yd', name: 'yard', to_base: '/9.144'
length_miles = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'mi', name: 'miles', to_base: '/16093.44'

# Mass
mass = Quantity.find_or_create_by! symbol: 'm', name: 'Mass', description: 'A measure of resistance to acceleration'
mass_kilogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'kg', name: 'kilogram'
mass_exagram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Eg', name: 'exagram', to_base: '*1000000000000000'
mass_petagram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Pg', name: 'petagram', to_base: '*1000000000000'
mass_teragram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Tg', name: 'teragram', to_base: '*1000000000'
mass_gigagram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Gg', name: 'gigagram', to_base: '*1000000'
mass_megagram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'Mg', name: 'megagram', to_base: '*1000'
mass_hectogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'hg', name: 'hectogram', to_base: '/10'
mass_decagram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'dag', name: 'decagram', to_base: '/100'
mass_gram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'g', name: 'gram', to_base: '/1000'
mass_decigram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'dg', name: 'decigram', to_base: '/10000'
mass_centigram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'cg', name: 'centigram', to_base: '/100000'
mass_miligram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'mg', name: 'miligram', to_base: '/1000000'
mass_microgram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'µg', name: 'microgram', to_base: '/1000000000'
mass_nanogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'ng', name: 'nanogram', to_base: '/10000000000000'
mass_picogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'pg', name: 'picogram', to_base: '/1000000000000000'
mass_femtogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'fg', name: 'femtogram', to_base: '/1000000000000000000'
mass_attogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'ag', name: 'attogram', to_base: '/1000000000000000000000'
mass_atomic_mass = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'u', name: 'atomic mass', to_base: '/0.000000000000000000000000166054'
mass_pound = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'lbs', name: 'pound', to_base: '/4.53592'

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


# Acceleration
acceleration = Quantity.find_or_create_by! symbol: 'a', name: 'Acceleration', description: 'Change of the speed or velocity per unit time', vector: true
acceleration_measurement = UnitOfMeasurement.find_or_create_by! quantity: acceleration, symbol: 'm s⁻²', name: 'Meter per second squared'





# Equations

## Length
Equation.find_or_create_by! quantity: length, equation: 'm*t'




# Translations

## Length
length.attributes = { name: 'Strecke', description: 'Die eindimensionale Ausdehnung eines Gegenstandes', locale: :de }
length_meter.attributes = { name: 'Meter', locale: :de }
length_exameter.attributes = { name: 'Exameter', locale: :de }
length_petameter.attributes = { name: 'Petameter', locale: :de }
length_terameter.attributes = { name: 'Terameter', locale: :de }
length_gigameter.attributes = { name: 'Gigameter', locale: :de }
length_megameter.attributes = { name: 'Megameter', locale: :de }
length_kilometer.attributes = { name: 'Kilometer', locale: :de }
length_hectometer.attributes = { name: 'Hektometer', locale: :de }
length_decameter.attributes = { name: 'Dekameter', locale: :de }
length_decimeter.attributes = { name: 'Dezimeter', locale: :de }
length_centimeter.attributes = { name: 'Zentimeter', locale: :de }
length_milimeter.attributes = { name: 'Milimeter', locale: :de }
length_micrometer.attributes = { name: 'Mikrometer', locale: :de }
length_nanometer.attributes = { name: 'Nanometer', locale: :de }
length_picometer.attributes = { name: 'Pikometer', locale: :de }
length_femtometer.attributes = { name: 'Femtometer', locale: :de }
length_attometer.attributes = { name: 'Attometer', locale: :de }
length_inch.attributes = { name: 'Zoll', locale: :de }
length_foot.attributes = { name: 'Fuß', locale: :de }
length_yard.attributes = { name: 'Yard', locale: :de }
length_miles.attributes = { name: 'Meilen', locale: :de }

## Mass
mass.attributes = { name: 'Masse', description: 'Ein Maß für Widerstand gegen Beschleunigung', locale: :de }
mass_kilogram.attributes = { name: 'Kilogramm', locale: :de }
mass_exagram.attributes = { name: 'Exagramm', locale: :de }
mass_petagram.attributes = { name: 'Petagramm', locale: :de }
mass_teragram.attributes = { name: 'Teragramm', locale: :de }
mass_gigagram.attributes = { name: 'Gigagramm', locale: :de }
mass_megagram.attributes = { name: 'Megagramm', locale: :de }
mass_hectogram.attributes = { name: 'Hektogramm', locale: :de }
mass_decagram.attributes = { name: 'Dekagramm', locale: :de }
mass_gram.attributes = { name: 'Gramm', locale: :de }
mass_decigram.attributes = { name: 'Dezigramm', locale: :de }
mass_centigram.attributes = { name: 'Zentigramm', locale: :de }
mass_miligram.attributes = { name: 'Miligramm', locale: :de }
mass_microgram.attributes = { name: 'Mikrogramm', locale: :de }
mass_nanogram.attributes = { name: 'Nanogramm', locale: :de }
mass_picogram.attributes = { name: 'Pikogramm', locale: :de }
mass_femtogram.attributes = { name: 'Femtogramm', locale: :de }
mass_attogram.attributes = { name: 'Attogramm', locale: :de }
mass_atomic_mass.attributes = { name: 'Atomare Masse', locale: :de }
mass_pound.attributes = { name: 'Pfund', locale: :de }
