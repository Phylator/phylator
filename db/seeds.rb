# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# Demo
user = User.create! email: 'demo@example.com', password: 'password'
user.encrypted_password




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
length_zeptometer = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'zm', name: 'zeptometer', to_base: '/1000000000000000000000'
length_yoctometer = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'ym', name: 'yoctometer', to_base: '/1000000000000000000000000'
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
mass_gram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'g', name: 'gram', to_base: '/1000'
mass_miligram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'mg', name: 'miligram', to_base: '/1000000'
mass_microgram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'µg', name: 'microgram', to_base: '/1000000000'
mass_nanogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'ng', name: 'nanogram', to_base: '/10000000000000'
mass_picogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'pg', name: 'picogram', to_base: '/1000000000000000'
mass_femtogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'fg', name: 'femtogram', to_base: '/1000000000000000000'
mass_attogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'ag', name: 'attogram', to_base: '/1000000000000000000000'
mass_zeptogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'zg', name: 'zeptogram', to_base: '/1000000000000000000000000'
mass_yoctogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'yg', name: 'yoctogram', to_base: '/1000000000000000000000000000'
mass_atomic_mass = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'u', name: 'atomic mass', to_base: '/0.000000000000000000000000166054'
mass_pound = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'lbs', name: 'pound', to_base: '/4.53592'

# Time
time = Quantity.find_or_create_by! symbol: 't', name: 'Time', description: 'The duration of an event'
time_second = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 's', name: 'second'
time_milisecond = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'ms', name: 'milisecond', to_base: '/1000'
time_microsecond = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'µs', name: 'microsecond', to_base: '/1000000'
time_nanosecond = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'ns', name: 'nanosecond', to_base: '/1000000000'
time_picosecond = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'ps', name: 'picosecond', to_base: '/1000000000000'
time_femtosecond = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'fs', name: 'femtosecond', to_base: '/1000000000000000'
time_attosecond = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'as', name: 'attosecond', to_base: '/1000000000000000000'
time_zeptosecond = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'zs', name: 'zeptosecond', to_base: '/1000000000000000000000'
time_yoctosecond = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'ys', name: 'yoctosecond', to_base: '/1000000000000000000000000'
time_minute = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'min', name: 'minute', to_base: '*60'
time_hour = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'h', name: 'hour', to_base: '*3600'
time_day = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'd', name: 'day', to_base: '*86400'
time_week = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'week', name: 'week', to_base: '*604800'
time_year = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'year', name: 'year', to_base: '*31557600'

# # Electric current
# electric_current = Quantity.find_or_create_by! symbol: 'I', name: 'Electric current', description: 'Rate of flow of electrical charge per unit time'
# electric_current_measurement = UnitOfMeasurement.find_or_create_by! quantity: electric_current, symbol: 'A', name: 'ampere'
#
# # Temperature
# temperature = Quantity.find_or_create_by! symbol: 'T', name: 'Temperature', description: 'Average kinetic energy per degree of freedom of a system'
# temperature_measurement = UnitOfMeasurement.find_or_create_by! quantity: temperature, symbol: 'K', name: 'kelvin'
#
# # Amount of substance
# amount_of_substance = Quantity.find_or_create_by! symbol: 'n', name: 'Amount of substance', description: 'Number of particles compared to the number of atoms in 0.012 kg of 12C'
# amount_of_substance_measurement = UnitOfMeasurement.find_or_create_by! quantity: amount_of_substance, symbol: 'mol', name: 'mole'
#
# # Luminous intensity
# luminous_intensity = Quantity.find_or_create_by! symbol: 'L', name: 'Luminous intensity', description: 'Wavelength-weighted power of emitted light per unit solid angle'
# luminous_intensity_measurement = UnitOfMeasurement.find_or_create_by! quantity: luminous_intensity, symbol: 'cd', name: 'candela'


# # Acceleration
# acceleration = Quantity.find_or_create_by! symbol: 'a', name: 'Acceleration', description: 'Change of the speed or velocity per unit time', vector: true
# acceleration_measurement = UnitOfMeasurement.find_or_create_by! quantity: acceleration, symbol: 'm s⁻²', name: 'meter per second squared'





# Equations

## Length
# Equation.find_or_create_by! quantity: length, equation: 'm * t'
# Equation.find_or_create_by! quantity: mass, equation: 'l / t'
# Equation.find_or_create_by! quantity: time, equation: 'l / m'




# Translations

## Length
length.update_attributes name: 'Länge', description: 'Die eindimensionale Ausdehnung eines Gegenstandes', locale: :de
length_meter.update_attributes name: 'Meter', locale: :de
length_exameter.update_attributes name: 'Exameter', locale: :de
length_petameter.update_attributes name: 'Petameter', locale: :de
length_terameter.update_attributes name: 'Terameter', locale: :de
length_gigameter.update_attributes name: 'Gigameter', locale: :de
length_megameter.update_attributes name: 'Megameter', locale: :de
length_kilometer.update_attributes name: 'Kilometer', locale: :de
length_hectometer.update_attributes name: 'Hektometer', locale: :de
length_decameter.update_attributes name: 'Dekameter', locale: :de
length_decimeter.update_attributes name: 'Dezimeter', locale: :de
length_centimeter.update_attributes name: 'Zentimeter', locale: :de
length_milimeter.update_attributes name: 'Milimeter', locale: :de
length_micrometer.update_attributes name: 'Mikrometer', locale: :de
length_nanometer.update_attributes name: 'Nanometer', locale: :de
length_picometer.update_attributes name: 'Pikometer', locale: :de
length_femtometer.update_attributes name: 'Femtometer', locale: :de
length_attometer.update_attributes name: 'Attometer', locale: :de
length_zeptometer.update_attributes name: 'Zeptometer', locale: :de
length_yoctometer.update_attributes name: 'Yoktometer', locale: :de
length_inch.update_attributes name: 'Zoll', locale: :de
length_foot.update_attributes name: 'Fuß', locale: :de
length_yard.update_attributes name: 'Yard', locale: :de
length_miles.update_attributes name: 'Meilen', locale: :de

## Mass
mass.update_attributes name: 'Masse', description: 'Ein Maß für Widerstand gegen Beschleunigung', locale: :de
mass_kilogram.update_attributes name: 'Kilogramm', locale: :de
mass_exagram.update_attributes name: 'Exagramm', locale: :de
mass_petagram.update_attributes name: 'Petagramm', locale: :de
mass_teragram.update_attributes name: 'Teragramm', locale: :de
mass_gigagram.update_attributes name: 'Gigagramm', locale: :de
mass_megagram.update_attributes name: 'Megagramm', locale: :de
mass_gram.update_attributes name: 'Gramm', locale: :de
mass_miligram.update_attributes name: 'Miligramm', locale: :de
mass_microgram.update_attributes name: 'Mikrogramm', locale: :de
mass_nanogram.update_attributes name: 'Nanogramm', locale: :de
mass_picogram.update_attributes name: 'Pikogramm', locale: :de
mass_femtogram.update_attributes name: 'Femtogramm', locale: :de
mass_attogram.update_attributes name: 'Attogramm', locale: :de
mass_zeptogram.update_attributes name: 'Zeptogramm', locale: :de
mass_yoctogram.update_attributes name: 'Yoktogramm', locale: :de
mass_atomic_mass.update_attributes name: 'Atomare Masse', locale: :de
mass_pound.update_attributes name: 'Pfund', locale: :de

## Time
time.update_attributes name: 'Zeit', description: 'Die Dauer eines Ereignisses', locale: :de
time_second.update_attributes name: 'Sekunde', locale: :de
time_milisecond.update_attributes name: 'Milisekunde', locale: :de
time_microsecond.update_attributes name: 'Mikrosekunde', locale: :de
time_nanosecond.update_attributes name: 'Nanosekunde', locale: :de
time_picosecond.update_attributes name: 'Pikosekunde', locale: :de
time_femtosecond.update_attributes name: 'Femtosekunde', locale: :de
time_attosecond.update_attributes name: 'Attosekunde', locale: :de
time_zeptosecond.update_attributes name: 'Zeptosekunde', locale: :de
time_yoctosecond.update_attributes name: 'Yoktosekunde', locale: :de
time_minute.update_attributes name: 'Minute', locale: :de
time_hour.update_attributes name: 'Stunde', locale: :de
time_day.update_attributes name: 'Tag', locale: :de
time_week.update_attributes name: 'Woche', locale: :de
time_year.update_attributes name: 'Jahr', locale: :de
