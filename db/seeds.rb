# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# Demo
user = User.create email: 'demo@phylator.com', password: 'password'
user&.encrypted_password




# Packs & Categories
mechanics = Category.find_or_create_by! name: 'Mechanics', description: 'Description'
mechanics_basics = Pack.find_or_create_by! category: mechanics, name: 'Mechanics (Basics)', description: 'Description', price: 0
kinematics = Pack.find_or_create_by! category: mechanics, name: 'Kinematics', description: 'Description', price: 1.99
dynamics = Pack.find_or_create_by! category: mechanics, name: 'Dynamics', description: 'Description', price: 1.99
thermodynamics = Category.find_or_create_by! name: 'Thermodynamics', description: 'Description'
thermodynamics_basics = Pack.find_or_create_by! category: thermodynamics, name: 'Thermodynamics (Basics)', description: 'Description', price: 0
thermodynamics_advanced = Pack.find_or_create_by! category: thermodynamics, name: 'Thermodynamics (Advanced)', description: 'Description', price: 1.99
electromagnetism = Category.find_or_create_by! name: 'Electromagnetism', description: 'Description'
electromagnetism_basics = Pack.find_or_create_by! category: electromagnetism, name: 'Electromagnetism (Basics)', description: 'Description', price: 0
electricity = Pack.find_or_create_by! category: electromagnetism, name: 'Electricity', description: 'Description', price: 1.99
magnetism = Pack.find_or_create_by! category: electromagnetism, name: 'Magnetism', description: 'Description', price: 1.99
optics = Pack.find_or_create_by! category: electromagnetism, name: 'Optics', description: 'Description', price: 1.99
quantum_mechanics = Category.find_or_create_by! name: 'Quantum mechanics', description: 'Description'
relativity = Pack.find_or_create_by! category: quantum_mechanics, name: 'Relativity', description: 'Description', price: 0
quantum_mechanics_basics = Pack.find_or_create_by! category: quantum_mechanics, name: 'Quantum mechanics (Basics)', description: 'Description', price: 1.99
chemical_physics = Category.find_or_create_by! name: 'Chemical physics', description: 'Description'
chemical_physics_basics = Pack.find_or_create_by! category: chemical_physics, name: 'Chemical physics (Basics)', description: 'Description', price: 1.99
chemical_physics_advanced = Pack.find_or_create_by! category: chemical_physics, name: 'Chemical physics (Advanced)', description: 'Description', price: 1.99




# Length (Mechanics)
length = Quantity.find_or_create_by! symbol: 'l', name: 'Length', description: 'The one-dimensional extent of an object', pack: mechanics_basics
meter = UnitOfMeasurement.find_or_create_by! symbol: 'm', name: 'meter', base: true
meter.unit_of_measurement_quantities.find_or_create_by! quantity: length
exameter = UnitOfMeasurement.find_or_create_by! symbol: 'Em', name: 'exameter', to_base: '*1000000000000000000'
exameter.unit_of_measurement_quantities.find_or_create_by! quantity: length
petameter = UnitOfMeasurement.find_or_create_by! symbol: 'Pm', name: 'petameter', to_base: '*1000000000000000'
petameter.unit_of_measurement_quantities.find_or_create_by! quantity: length
terameter = UnitOfMeasurement.find_or_create_by! symbol: 'Tm', name: 'terameter', to_base: '*1000000000000'
terameter.unit_of_measurement_quantities.find_or_create_by! quantity: length
gigameter = UnitOfMeasurement.find_or_create_by! symbol: 'Gm', name: 'gigameter', to_base: '*1000000000'
gigameter.unit_of_measurement_quantities.find_or_create_by! quantity: length
megameter = UnitOfMeasurement.find_or_create_by! symbol: 'Mm', name: 'megameter', to_base: '*1000000'
megameter.unit_of_measurement_quantities.find_or_create_by! quantity: length
kilometer = UnitOfMeasurement.find_or_create_by! symbol: 'km', name: 'kilometer', to_base: '*1000'
kilometer.unit_of_measurement_quantities.find_or_create_by! quantity: length
hectometer = UnitOfMeasurement.find_or_create_by! symbol: 'hm', name: 'hectometer', to_base: '*100'
hectometer.unit_of_measurement_quantities.find_or_create_by! quantity: length
decameter = UnitOfMeasurement.find_or_create_by! symbol: 'dam', name: 'decameter', to_base: '*10'
decameter.unit_of_measurement_quantities.find_or_create_by! quantity: length
decimeter = UnitOfMeasurement.find_or_create_by! symbol: 'dm', name: 'decimeter', to_base: '/10'
decimeter.unit_of_measurement_quantities.find_or_create_by! quantity: length
centimeter = UnitOfMeasurement.find_or_create_by! symbol: 'cm', name: 'centimeter', to_base: '/100'
centimeter.unit_of_measurement_quantities.find_or_create_by! quantity: length
milimeter = UnitOfMeasurement.find_or_create_by! symbol: 'mm', name: 'milimeter', to_base: '/1000'
milimeter.unit_of_measurement_quantities.find_or_create_by! quantity: length
micrometer = UnitOfMeasurement.find_or_create_by! symbol: 'µm', name: 'micrometer', to_base: '/1000000'
micrometer.unit_of_measurement_quantities.find_or_create_by! quantity: length
nanometer = UnitOfMeasurement.find_or_create_by! symbol: 'nm', name: 'nanometer', to_base: '/1000000000'
nanometer.unit_of_measurement_quantities.find_or_create_by! quantity: length
picometer = UnitOfMeasurement.find_or_create_by! symbol: 'pm', name: 'picometer', to_base: '/1000000000000'
picometer.unit_of_measurement_quantities.find_or_create_by! quantity: length
femtometer = UnitOfMeasurement.find_or_create_by! symbol: 'fm', name: 'femtometer', to_base: '/1000000000000000'
femtometer.unit_of_measurement_quantities.find_or_create_by! quantity: length
attometer = UnitOfMeasurement.find_or_create_by! symbol: 'am', name: 'attometer', to_base: '/1000000000000000000'
attometer.unit_of_measurement_quantities.find_or_create_by! quantity: length
zeptometer = UnitOfMeasurement.find_or_create_by! symbol: 'zm', name: 'zeptometer', to_base: '/1000000000000000000000'
zeptometer.unit_of_measurement_quantities.find_or_create_by! quantity: length
yoctometer = UnitOfMeasurement.find_or_create_by! symbol: 'ym', name: 'yoctometer', to_base: '/1000000000000000000000000'
yoctometer.unit_of_measurement_quantities.find_or_create_by! quantity: length
inch = UnitOfMeasurement.find_or_create_by! symbol: 'in', name: 'inch', to_base: '/0.254'
inch.unit_of_measurement_quantities.find_or_create_by! quantity: length
foot = UnitOfMeasurement.find_or_create_by! symbol: 'ft', name: 'foot', to_base: '/3.048'
foot.unit_of_measurement_quantities.find_or_create_by! quantity: length
yard = UnitOfMeasurement.find_or_create_by! symbol: 'yd', name: 'yard', to_base: '/9.144'
yard.unit_of_measurement_quantities.find_or_create_by! quantity: length
miles = UnitOfMeasurement.find_or_create_by! symbol: 'mi', name: 'miles', to_base: '/16093.44'
miles.unit_of_measurement_quantities.find_or_create_by! quantity: length
## Distance traveled (Mechanics)
distance_traveled = Quantity.find_or_create_by! symbol: 's', name: 'Distance traveled', description: 'Distance an object traveled', pack: mechanics_basics, parent_quantity: length
meter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
exameter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
petameter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
terameter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
gigameter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
megameter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
kilometer.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
hectometer.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
decameter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
decimeter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
centimeter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
milimeter.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
micrometer.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
nanometer.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
picometer.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
femtometer.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
attometer.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
zeptometer.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
yoctometer.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
inch.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
foot.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
yard.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled
miles.unit_of_measurement_quantities.find_or_create_by! quantity: distance_traveled

# Mass (Mechanics)
mass = Quantity.find_or_create_by! symbol: 'm', name: 'Mass', description: 'A measure of resistance to acceleration', pack: mechanics_basics
kilogram = UnitOfMeasurement.find_or_create_by! symbol: 'kg', name: 'kilogram', base: true
kilogram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
exagram = UnitOfMeasurement.find_or_create_by! symbol: 'Eg', name: 'exagram', to_base: '*1000000000000000'
exagram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
petagram = UnitOfMeasurement.find_or_create_by! symbol: 'Pg', name: 'petagram', to_base: '*1000000000000'
petagram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
teragram = UnitOfMeasurement.find_or_create_by! symbol: 'Tg', name: 'teragram', to_base: '*1000000000'
teragram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
gigagram = UnitOfMeasurement.find_or_create_by! symbol: 'Gg', name: 'gigagram', to_base: '*1000000'
gigagram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
megagram = UnitOfMeasurement.find_or_create_by! symbol: 'Mg', name: 'megagram', to_base: '*1000'
megagram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
gram = UnitOfMeasurement.find_or_create_by! symbol: 'g', name: 'gram', to_base: '/1000'
gram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
miligram = UnitOfMeasurement.find_or_create_by! symbol: 'mg', name: 'miligram', to_base: '/1000000'
miligram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
microgram = UnitOfMeasurement.find_or_create_by! symbol: 'µg', name: 'microgram', to_base: '/1000000000'
microgram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
nanogram = UnitOfMeasurement.find_or_create_by! symbol: 'ng', name: 'nanogram', to_base: '/10000000000000'
nanogram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
picogram = UnitOfMeasurement.find_or_create_by! symbol: 'pg', name: 'picogram', to_base: '/1000000000000000'
picogram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
femtogram = UnitOfMeasurement.find_or_create_by! symbol: 'fg', name: 'femtogram', to_base: '/1000000000000000000'
femtogram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
attogram = UnitOfMeasurement.find_or_create_by! symbol: 'ag', name: 'attogram', to_base: '/1000000000000000000000'
attogram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
zeptogram = UnitOfMeasurement.find_or_create_by! symbol: 'zg', name: 'zeptogram', to_base: '/1000000000000000000000000'
zeptogram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
yoctogram = UnitOfMeasurement.find_or_create_by! symbol: 'yg', name: 'yoctogram', to_base: '/1000000000000000000000000000'
yoctogram.unit_of_measurement_quantities.find_or_create_by! quantity: mass
atomic_mass = UnitOfMeasurement.find_or_create_by! symbol: 'u', name: 'atomic mass', to_base: '/0.000000000000000000000000166054'
atomic_mass.unit_of_measurement_quantities.find_or_create_by! quantity: mass
pound = UnitOfMeasurement.find_or_create_by! symbol: 'lbs', name: 'pound', to_base: '/4.53592'
pound.unit_of_measurement_quantities.find_or_create_by! quantity: mass

# Time (Mechanics)
time = Quantity.find_or_create_by! symbol: 't', name: 'Time', description: 'The duration of an event', pack: mechanics_basics
second = UnitOfMeasurement.find_or_create_by! symbol: 's', name: 'second', base: true
second.unit_of_measurement_quantities.find_or_create_by! quantity: time
milisecond = UnitOfMeasurement.find_or_create_by! symbol: 'ms', name: 'milisecond', to_base: '/1000'
milisecond.unit_of_measurement_quantities.find_or_create_by! quantity: time
microsecond = UnitOfMeasurement.find_or_create_by! symbol: 'µs', name: 'microsecond', to_base: '/1000000'
microsecond.unit_of_measurement_quantities.find_or_create_by! quantity: time
nanosecond = UnitOfMeasurement.find_or_create_by! symbol: 'ns', name: 'nanosecond', to_base: '/1000000000'
nanosecond.unit_of_measurement_quantities.find_or_create_by! quantity: time
picosecond = UnitOfMeasurement.find_or_create_by! symbol: 'ps', name: 'picosecond', to_base: '/1000000000000'
picosecond.unit_of_measurement_quantities.find_or_create_by! quantity: time
femtosecond = UnitOfMeasurement.find_or_create_by! symbol: 'fs', name: 'femtosecond', to_base: '/1000000000000000'
femtosecond.unit_of_measurement_quantities.find_or_create_by! quantity: time
attosecond = UnitOfMeasurement.find_or_create_by! symbol: 'as', name: 'attosecond', to_base: '/1000000000000000000'
attosecond.unit_of_measurement_quantities.find_or_create_by! quantity: time
zeptosecond = UnitOfMeasurement.find_or_create_by! symbol: 'zs', name: 'zeptosecond', to_base: '/1000000000000000000000'
zeptosecond.unit_of_measurement_quantities.find_or_create_by! quantity: time
yoctosecond = UnitOfMeasurement.find_or_create_by! symbol: 'ys', name: 'yoctosecond', to_base: '/1000000000000000000000000'
yoctosecond.unit_of_measurement_quantities.find_or_create_by! quantity: time
minute = UnitOfMeasurement.find_or_create_by! symbol: 'min', name: 'minute', to_base: '*60'
minute.unit_of_measurement_quantities.find_or_create_by! quantity: time
hour = UnitOfMeasurement.find_or_create_by! symbol: 'h', name: 'hour', to_base: '*3600'
hour.unit_of_measurement_quantities.find_or_create_by! quantity: time
day = UnitOfMeasurement.find_or_create_by! symbol: 'd', name: 'day', to_base: '*86400'
day.unit_of_measurement_quantities.find_or_create_by! quantity: time
week = UnitOfMeasurement.find_or_create_by! symbol: 'week', name: 'week', to_base: '*604800'
week.unit_of_measurement_quantities.find_or_create_by! quantity: time
year = UnitOfMeasurement.find_or_create_by! symbol: 'year', name: 'year', to_base: '*31557600'
year.unit_of_measurement_quantities.find_or_create_by! quantity: time

# Electric current (Electromagnetism)
electric_current = Quantity.find_or_create_by! symbol: 'I', name: 'Electric current', description: 'Rate of flow of electrical charge per unit time', pack: electromagnetism_basics
ampere = UnitOfMeasurement.find_or_create_by! symbol: 'A', name: 'ampere', base: true
ampere.unit_of_measurement_quantities.find_or_create_by! quantity: electric_current
miliampere = UnitOfMeasurement.find_or_create_by! symbol: 'mA', name: 'miliampere', to_base: '/1000'
miliampere.unit_of_measurement_quantities.find_or_create_by! quantity: electric_current
microampere = UnitOfMeasurement.find_or_create_by! symbol: 'µA', name: 'microampere', to_base: '/1000000'
microampere.unit_of_measurement_quantities.find_or_create_by! quantity: electric_current
nanoampere = UnitOfMeasurement.find_or_create_by! symbol: 'nA', name: 'nanoampere', to_base: '/1000000000'
nanoampere.unit_of_measurement_quantities.find_or_create_by! quantity: electric_current
picoampere = UnitOfMeasurement.find_or_create_by! symbol: 'pA', name: 'picoampere', to_base: '/1000000000000'
picoampere.unit_of_measurement_quantities.find_or_create_by! quantity: electric_current
femtoampere = UnitOfMeasurement.find_or_create_by! symbol: 'fA', name: 'femtoampere', to_base: '/1000000000000000'
femtoampere.unit_of_measurement_quantities.find_or_create_by! quantity: electric_current
attoampere = UnitOfMeasurement.find_or_create_by! symbol: 'aA', name: 'attoampere', to_base: '/1000000000000000000'
attoampere.unit_of_measurement_quantities.find_or_create_by! quantity: electric_current
zeptoampere = UnitOfMeasurement.find_or_create_by! symbol: 'zA', name: 'zeptoampere', to_base: '/1000000000000000000000'
zeptoampere.unit_of_measurement_quantities.find_or_create_by! quantity: electric_current
yoctoampere = UnitOfMeasurement.find_or_create_by! symbol: 'yA', name: 'yoctoampere', to_base: '/1000000000000000000000000'
yoctoampere.unit_of_measurement_quantities.find_or_create_by! quantity: electric_current

# Temperature (Thermodynamics)
temperature = Quantity.find_or_create_by! symbol: 'T', name: 'Temperature', description: 'Average kinetic energy per degree of freedom of a system', pack: thermodynamics_basics
kelvin = UnitOfMeasurement.find_or_create_by! symbol: 'K', name: 'kelvin', base: true
kelvin.unit_of_measurement_quantities.find_or_create_by! quantity: temperature
degree_celcius = UnitOfMeasurement.find_or_create_by! symbol: '°C', name: 'degree celcius', to_base: '+273.15'
degree_celcius.unit_of_measurement_quantities.find_or_create_by! quantity: temperature
degree_fahrenheit = UnitOfMeasurement.find_or_create_by! symbol: '°F', name: 'degree fahrenheit', to_base: '*(5/9)+459.67*(5/9)', f_base: '*(9/5)-459.67' ##### UPDATE CONVERSIONS ######
degree_fahrenheit.unit_of_measurement_quantities.find_or_create_by! quantity: temperature

# Amount of substance (Chemical physics)
amount_of_substance = Quantity.find_or_create_by! symbol: 'n', name: 'Amount of substance', description: 'Number of particles compared to the number of atoms in 0.012 kg of 12C', pack: chemical_physics_basics
mole = UnitOfMeasurement.find_or_create_by! symbol: 'mol', name: 'mole', base: true
mole.unit_of_measurement_quantities.find_or_create_by! quantity: amount_of_substance

# Luminous intensity (Electromagnetism)
luminous_intensity = Quantity.find_or_create_by! symbol: 'L', name: 'Luminous intensity', description: 'Wavelength-weighted power of emitted light per unit solid angle', pack: optics
candela = UnitOfMeasurement.find_or_create_by! symbol: 'cd', name: 'candela', base: true
candela.unit_of_measurement_quantities.find_or_create_by! quantity: luminous_intensity


# Acceleration (Mechanics)
acceleration = Quantity.find_or_create_by! symbol: 'a', name: 'Acceleration', description: 'Change of the speed or velocity per unit time', vector: true, pack: mechanics_basics
meter_per_square_second = UnitOfMeasurement.find_or_create_by! symbol: 'm s<sup>-2</sup>', name: 'meter per square second', base: true
meter_per_square_second.unit_of_measurement_quantities.find_or_create_by! quantity: acceleration

# Angular acceleration (Mechanics)
angular_acceleration = Quantity.find_or_create_by! symbol: 'a<sub>α</sub>', name: 'Angular acceleration', description: 'Change in angular speed or velocity per unit time', pack: kinematics
rad_per_square_second = UnitOfMeasurement.find_or_create_by! symbol: 'rad s<sup>-2</sup>', name: 'rad per square second', base: true
rad_per_square_second.unit_of_measurement_quantities.find_or_create_by! quantity: angular_acceleration

# Angular velocity (Mechanics)
angular_velocity = Quantity.find_or_create_by! symbol: 'ω', name: 'Angular velocity', description: 'The angle incremented in a plane by a segment connecting an object and a reference point per unit time', pack: kinematics
rad_per_second = UnitOfMeasurement.find_or_create_by! symbol: 'rad s<sup>-1</sup>', name: 'rad per second', base: true
rad_per_second.unit_of_measurement_quantities.find_or_create_by! quantity: angular_velocity

# Area (Mechanics)
area = Quantity.find_or_create_by! symbol: 'A', name: 'Area', description: 'Extent of a surface', pack: mechanics_basics
square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'm²', name: 'square meter', base: true
square_meter.unit_of_measurement_quantities.find_or_create_by! quantity: area

# Area density (Chemical physics)
area_density = Quantity.find_or_create_by! symbol: 'ρ<sub>A</sub>', name: 'Area density', description: 'Mass per unit area', pack: chemical_physics_advanced
kilogram_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'kg m<sup>-2</sup>', name: 'kilogram per square meter', base: true
kilogram_per_square_meter.unit_of_measurement_quantities.find_or_create_by! quantity: area_density

# Capacitance (Electromagnetism)
capacitance = Quantity.find_or_create_by! symbol: 'C', name: 'Capacitance', description: 'Stored charge per unit electric potential', pack: electricity
farad = UnitOfMeasurement.find_or_create_by! symbol: 'F', name: 'farad', base: true
farad.unit_of_measurement_quantities.find_or_create_by! quantity: capacitance

# Chemical potential (Chemical physics)
chemical_potential = Quantity.find_or_create_by! symbol: 'μ<sub>ch</sub>', name: 'Chemical potential', description: 'Energy per unit change in amount of substance', pack: chemical_physics_advanced
joule_per_mole = UnitOfMeasurement.find_or_create_by! symbol: 'J mol<sup>-1</sup>', name: 'joule per mole', base: true
joule_per_mole.unit_of_measurement_quantities.find_or_create_by! quantity: chemical_potential

# Current density (Electromagnetism)
current_density = Quantity.find_or_create_by! symbol: 'J', name: 'Current density', description: 'Electric current per unit cross-section area', vector: true, pack: electricity
ampere_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'A m<sup>-2</sup>', name: 'ampere per square meter', base: true
ampere_per_square_meter.unit_of_measurement_quantities.find_or_create_by! quantity: current_density

# Electric charge (Electromagnetism)
electric_charge = Quantity.find_or_create_by! symbol: 'Q', name: 'Electric charge', description: 'The force per unit electric field strength', pack: electromagnetism_basics
coulomb = UnitOfMeasurement.find_or_create_by! symbol: 'C', name: 'coulomb', base: true
coulomb.unit_of_measurement_quantities.find_or_create_by! quantity: electric_charge

# Electric charge density (Electromagnetism)
electric_charge_density = Quantity.find_or_create_by! symbol: 'ρ<sub>Q</sub>', name: 'Electric charge density', description: 'Electric charge per unit volume', pack: electricity
coulomb_per_cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'C m<sup>-3</sup>', name: 'coulomb per cubic meter', base: true
coulomb_per_cubic_meter.unit_of_measurement_quantities.find_or_create_by! quantity: electric_charge_density

# Electric displacement (Electromagnetism)
electric_displacement = Quantity.find_or_create_by! symbol: 'D', name: 'Electric displacement', description: 'Strength of the electric displacement', vector: true, pack: electricity
coulomb_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'C m<sup>-2</sup>', name: 'coulomb per square meter', base: true
coulomb_per_square_meter.unit_of_measurement_quantities.find_or_create_by! quantity: electric_displacement

# Electric field strength (Electromagnetism)
electric_field_strength = Quantity.find_or_create_by! symbol: 'E', name: 'Electric field strength', description: 'Strength of the electric field', vector: true, pack: electricity
volt_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'V m<sup>-1</sup>', name: 'volt per meter', base: true
volt_per_meter.unit_of_measurement_quantities.find_or_create_by! quantity: electric_field_strength

# Electrical conductance (Electromagnetism)
electrical_conductance = Quantity.find_or_create_by! symbol: 'G', name: 'Electrical conductance', description: 'Measure for how easily current flows through a material', pack: electricity
siemens = UnitOfMeasurement.find_or_create_by! symbol: 'S', name: 'siemens', base: true
siemens.unit_of_measurement_quantities.find_or_create_by! quantity: electrical_conductance

# Electrical conductivity (Electromagnetism)
electrical_conductivity = Quantity.find_or_create_by! symbol: 'σ', name: 'Electrical conductivity', description: "Measure of a material's ability to conduct an electric current", pack: electricity
siemens_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'S m<sup>-1</sup>', name: 'siemens per meter', base: true
siemens_per_meter.unit_of_measurement_quantities.find_or_create_by! quantity: electrical_conductivity

# Electric potential (Electromagnetism)
electric_potential = Quantity.find_or_create_by! symbol: 'U', name: 'Electric potential', description: 'Energy required to move a unit charge through an electric field from a reference point', pack: electromagnetism_basics
volt = UnitOfMeasurement.find_or_create_by! symbol: 'V', name: 'volt', base: true
volt.unit_of_measurement_quantities.find_or_create_by! quantity: electric_potential

# Electrical resistance (Electromagnetism)
electrical_resistance = Quantity.find_or_create_by! symbol: 'R', name: 'Electrical resistance', description: 'Electric potential per unit electric current', pack: electricity
ohm = UnitOfMeasurement.find_or_create_by! symbol: 'Ω', name: 'ohm', base: true
ohm.unit_of_measurement_quantities.find_or_create_by! quantity: electrical_resistance

# Electrical resistivity (Electromagnetism)
electrical_resistivity = Quantity.find_or_create_by! symbol: 'ρ<sub>el</sub>', name: 'Electrical resistivity', description: 'Bulk property equivalent of electrical resistance', pack: electricity
ohm_meter = UnitOfMeasurement.find_or_create_by! symbol: 'Ω m', name: 'ohm meter', base: true
ohm_meter.unit_of_measurement_quantities.find_or_create_by! quantity: electrical_resistivity

# Energy (Mechanics)
energy = Quantity.find_or_create_by! symbol: 'E<sub>i</sub>', name: 'Energy', description: 'Capacity of a body or system to do work', pack: mechanics_basics
joule = UnitOfMeasurement.find_or_create_by! symbol: 'J', name: 'joule', base: true
joule.unit_of_measurement_quantities.find_or_create_by! quantity: energy

# Energy density (Chemical physics)
energy_density = Quantity.find_or_create_by! symbol: 'ρ<sub>E</sub>', name: 'Energy density', description: 'Energy per unit volume', pack: chemical_physics_advanced
joule_per_cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'J m<sup>-3</sup>', name: 'joule per cubic meter', base: true
joule_per_cubic_meter.unit_of_measurement_quantities.find_or_create_by! quantity: energy_density

# Entropy (Thermodynamics)
entropy = Quantity.find_or_create_by! symbol: 'S<sub>sys</sub>', name: 'Entropy', description: 'Logarithmic measure of the number of available states of a system', pack: thermodynamics_advanced
joule_per_kelvin = UnitOfMeasurement.find_or_create_by! symbol: 'J K<sup>-1</sup>', name: 'joule per kelvin', base: true
joule_per_kelvin.unit_of_measurement_quantities.find_or_create_by! quantity: entropy

# Force (Mechanics)
force = Quantity.find_or_create_by! symbol: 'F', name: 'Force', description: 'Transfer of momentum per unit time', vector: true, pack: mechanics_basics
newton = UnitOfMeasurement.find_or_create_by! symbol: 'N', name: 'newton', base: true
newton.unit_of_measurement_quantities.find_or_create_by! quantity: force

# Frequency (Mechanics)
frequency = Quantity.find_or_create_by! symbol: 'f', name: 'Frequency', description: 'Number of (periodic) occurrences per unit time', pack: mechanics_basics
hertz = UnitOfMeasurement.find_or_create_by! symbol: 'Hz', name: 'hertz', base: true
hertz.unit_of_measurement_quantities.find_or_create_by! quantity: frequency

# Heat (Thermodynamics)
heat = Quantity.find_or_create_by! symbol: 'Q<sub>th</sub>', name: 'Heat', description: 'Thermal energy', pack: thermodynamics_basics
joule.unit_of_measurement_quantities.find_or_create_by! quantity: heat

# Heat capacity (Thermodynamics)
heat_capacity = Quantity.find_or_create_by! symbol: 'C<sub>p</sub>', name: 'Heat capacity', description: 'Energy per unit temperature change', pack: thermodynamics_advanced
joule_per_kelvin.unit_of_measurement_quantities.find_or_create_by! quantity: heat_capacity

# Heat flux density (Thermodynamics)
heat_flux_density = Quantity.find_or_create_by! symbol: 'ϕ<sub>Q</sub>', name: 'Heat flux density', description: 'Heat flow per unit time per unit surface area', pack: thermodynamics_advanced
watt_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'W m<sup>-2</sup>', name: 'watt per square meter', base: true
watt_per_square_meter.unit_of_measurement_quantities.find_or_create_by! quantity: heat_flux_density

# Illuminance (Electromagnetism)
illuminance = Quantity.find_or_create_by! symbol: 'E<sub>v</sub>', name: 'Illuminance', description: 'Luminous flux per unit surface area', pack: optics
lux = UnitOfMeasurement.find_or_create_by! symbol: 'lx', name: 'lux', base: true
lux.unit_of_measurement_quantities.find_or_create_by! quantity: illuminance

# Impedance (Electromagnetism)
impedance = Quantity.find_or_create_by! symbol: 'Z', name: 'Impedance', description: 'Resistance to an alternating current of a given frequency, including effect on phase', pack: electricity
ohm.unit_of_measurement_quantities.find_or_create_by! quantity: impedance

# Impulse (Mechanics)
impulse = Quantity.find_or_create_by! symbol: 'Δp', name: 'Impulse', description: 'Transferred momentum', vector: true, pack: dynamics
newton_second = UnitOfMeasurement.find_or_create_by! symbol: 'N s', name: 'newton second', base: true
newton_second.unit_of_measurement_quantities.find_or_create_by! quantity: impulse

# Inductance (Electromagnetism)
inductance = Quantity.find_or_create_by! symbol: 'L<sub>m</sub>', name: 'Inductance', description: 'Magnetic flux generated per unit current through a circuit', pack: magnetism
henry = UnitOfMeasurement.find_or_create_by! symbol: 'H', name: 'henry', base: true
henry.unit_of_measurement_quantities.find_or_create_by! quantity: inductance

# Intensity (Electromagnetism)
intensity = Quantity.find_or_create_by! symbol: 'I<sub>P</sub>', name: 'Intensity', description: 'Power per unit cross sectional area', pack: electricity
watt_per_square_meter.unit_of_measurement_quantities.find_or_create_by! quantity: intensity

# Luminous flux (Electromagnetism)
luminous_flux = Quantity.find_or_create_by! symbol: 'F<sub>ph</sub>', name: 'Luminous flux', description: 'Perceived power of a light source', pack: optics
lumen = UnitOfMeasurement.find_or_create_by! symbol: 'lm', name: 'lumen', base: true
lumen.unit_of_measurement_quantities.find_or_create_by! quantity: luminous_flux

# Magnetic field strength (Electromagnetism)
magnetic_field_strength = Quantity.find_or_create_by! symbol: 'H', name: 'Magnetic field strength', description: 'Strength of a magnetic field', vector: true, pack: magnetism
ampere_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'A m<sup>-1</sup>', name: 'ampere per meter', base: true
ampere_per_meter.unit_of_measurement_quantities.find_or_create_by! quantity: magnetic_field_strength

# Magnetic flux (Electromagnetism)
magnetic_flux = Quantity.find_or_create_by! symbol: 'Φ', name: 'Magnetic flux', description: 'Measure of magnetism, taking account of the strength and the extent of a magnetic field', pack: magnetism
weber = UnitOfMeasurement.find_or_create_by! symbol: 'Wb', name: 'weber', base: true
weber.unit_of_measurement_quantities.find_or_create_by! quantity: magnetic_flux

# Magnetic flux density (Electromagnetism)
magnetic_flux_density = Quantity.find_or_create_by! symbol: 'B', name: 'Magnetic flux density', description: 'Measure for the strength of the magnetic field', pack: magnetism
tesla = UnitOfMeasurement.find_or_create_by! symbol: 'T', name: 'tesla', base: true
tesla.unit_of_measurement_quantities.find_or_create_by! quantity: magnetic_flux_density

# Magnetization (Electromagnetism)
magnetization = Quantity.find_or_create_by! symbol: 'M', name: 'Magnetization', description: 'Amount of magnetic moment per unit volume', vector: true, pack: magnetism
ampere_per_meter.unit_of_measurement_quantities.find_or_create_by! quantity: magnetization

# Density (Chemical physics)
density = Quantity.find_or_create_by! symbol: 'ρ', name: 'Density', description: 'Mass per unit volume', pack: chemical_physics_basics
kilogram_per_cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'kg m<sup>-3</sup>', name: 'kilogram per cubic meter', base: true
kilogram_per_cubic_meter.unit_of_measurement_quantities.find_or_create_by! quantity: density

# Molar concentration (Chemical physics)
molar_concentration = Quantity.find_or_create_by! symbol: 'C<sub>mol</sub>', name: 'Molar concentration', description: 'Amount of substance per unit volume', pack: chemical_physics_advanced
mole_per_cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'mol m<sup>-3</sup>', name: 'mole per cubic meter', base: true
mole_per_cubic_meter.unit_of_measurement_quantities.find_or_create_by! quantity: molar_concentration

# Molar heat capacity (Chemical physics)
molar_heat_capacity = Quantity.find_or_create_by! symbol: 'c<sub>mol</sub>', name: 'Molar heat capacity', description: 'Heat capacity of a material per unit amount of substance', pack: chemical_physics_advanced
joule_per_kelvin_mole = UnitOfMeasurement.find_or_create_by! symbol: 'J K<sup>-1</sup> mol<sup>-1</sup>', name: 'joule per kelvin mole', base: true
joule_per_kelvin_mole.unit_of_measurement_quantities.find_or_create_by! quantity: molar_heat_capacity

# Moment of inertia (Mechanics)
moment_of_inertia = Quantity.find_or_create_by! symbol: 'I<sub>m</sub>', name: 'Moment of inertia', description: 'Inertia of an object with respect to angular acceleration', pack: kinematics
kilogram_per_square_meter.unit_of_measurement_quantities.find_or_create_by! quantity: moment_of_inertia

# Momentum (Mechanics)
momentum = Quantity.find_or_create_by! symbol: 'p', name: 'Momentum', description: "Product of an object's mass and velocity", vector: true, pack: dynamics
newton_second.unit_of_measurement_quantities.find_or_create_by! quantity: momentum

# Permeability (Electromagnetism)
permeability = Quantity.find_or_create_by! symbol: 'μ', name: 'Permeability', description: 'Measure for how the magnetization of material is affected by the application of an external magnetic field', pack: magnetism
henry_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'H m<sup>-1</sup>', name: 'henry per meter', base: true
henry_per_meter.unit_of_measurement_quantities.find_or_create_by! quantity: permeability

# Permittivity (Electromagnetism)
permittivity = Quantity.find_or_create_by! symbol: 'ε', name: 'Permittivity', description: 'Measure for how the polarization of a material is affected by the application of an external electric field', pack: electricity
farad_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'F m<sup>-1</sup>', name: 'farad per meter', base: true
farad_per_meter.unit_of_measurement_quantities.find_or_create_by! quantity: permittivity

# Plain angle (Mechanics)
plain_angle = Quantity.find_or_create_by! symbol: 'θ', name: 'Plain angle', description: 'Ratio of circular arc length to radius', pack: mechanics_basics
radian = UnitOfMeasurement.find_or_create_by! symbol: 'rad', name: 'radian', base: true
radian.unit_of_measurement_quantities.find_or_create_by! quantity: plain_angle

# Power (Electromagnetism)
power = Quantity.find_or_create_by! symbol: 'P', name: 'Power', description: 'Rate of transfer of energy per unit time', pack: electromagnetism_basics
watt = UnitOfMeasurement.find_or_create_by! symbol: 'W', name: 'watt', base: true
watt.unit_of_measurement_quantities.find_or_create_by! quantity: power

# Pressure (Thermodynamics)
pressure = Quantity.find_or_create_by! symbol: 'p<sub>f</sub>', name: 'Pressure', description: 'Force per unit area', pack: thermodynamics_advanced
pascal = UnitOfMeasurement.find_or_create_by! symbol: 'Pa', name: 'pascal', base: true
pascal.unit_of_measurement_quantities.find_or_create_by! quantity: pressure

# Reaction rate (Chemical physics)
reaction_rate = Quantity.find_or_create_by! symbol: 'r', name: 'Reaction rate', description: 'Rate of a chemical reaction for unit time', pack: chemical_physics_advanced
mole_per_cubic_meter_second = UnitOfMeasurement.find_or_create_by! symbol: 'mol m<sup>-3</sup> s<sup>-1</sup>', name: 'molde per cubic meter second', base: true
mole_per_cubic_meter_second.unit_of_measurement_quantities.find_or_create_by! quantity: reaction_rate

# Speed (Mechanics)
speed = Quantity.find_or_create_by! symbol: 'v<sub>abs</sub>', name: 'Speed', description: 'Moved distance per unit time: the first time derivative of position', pack: mechanics_basics
meter_per_second = UnitOfMeasurement.find_or_create_by! symbol: 'm s<sup>-1</sup>', name: 'meter per second', base: true
meter_per_second.unit_of_measurement_quantities.find_or_create_by! quantity: speed

# Spin (Quantum mechanics)
spin = Quantity.find_or_create_by! symbol: 'S', name: 'Spin', description: 'Quantum-mechanically defined angular momentum of a particle', pack: quantum_mechanics_basics
kilogram_square_meter_per_second = UnitOfMeasurement.find_or_create_by! symbol: 'kg m<sup>2</sup> s<sup>-1</sup>', name: 'kilogram square meter per second', base: true
kilogram_square_meter_per_second.unit_of_measurement_quantities.find_or_create_by! quantity: spin

# Stress (Quantum mechanics)
stress = Quantity.find_or_create_by! symbol: 'p<sub>p</sub>', name: 'Stress', description: 'Force per unit oriented surface area', pack: relativity
pascal.unit_of_measurement_quantities.find_or_create_by! quantity: stress

# Surface tension (Chemical physics)
surface_tension = Quantity.find_or_create_by! symbol: 'γ', name: 'Surface tension', description: 'Energy change per unit change in surface area', pack: chemical_physics_basics
joule_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'J m<sup>-2</sup>', name: 'joule per square meter', base: true
joule_per_square_meter.unit_of_measurement_quantities.find_or_create_by! quantity: surface_tension

# Thermal conductivity (Thermodynamics)
thermal_conductivity = Quantity.find_or_create_by! symbol: 'k<sub>th</sub>', name: 'Thermal conductivity', description: 'Measure for the ease with which a material conducts heat', pack: thermodynamics_advanced
watt_per_meter_kelvin = UnitOfMeasurement.find_or_create_by! symbol: 'W m<sup>-1</sup> K<sup>-1</sup>', name: 'watt per meter kelvin', base: true
watt_per_meter_kelvin.unit_of_measurement_quantities.find_or_create_by! quantity: thermal_conductivity

# Torque (Mechanics)
torque = Quantity.find_or_create_by! symbol: 'τ', name: 'Torque', description: 'Product of a force and the perpendicular distance of the force from the point about which it is exerted', pack: dynamics
newton_meter = UnitOfMeasurement.find_or_create_by! symbol: 'N m', name: 'newton meter', base: true
newton_meter.unit_of_measurement_quantities.find_or_create_by! quantity: torque

# Velocity (Mechanics)
velocity = Quantity.find_or_create_by! symbol: 'v', name: 'Velocity', description: 'Speed and direction of an object', vector: true, pack: mechanics_basics
meter_per_second.unit_of_measurement_quantities.find_or_create_by! quantity: velocity
## Initial velocity (Mechanics)
initial_velocity = Quantity.find_or_create_by! symbol: 'v<sub>init</sub>', name: 'Initial velocity', description: 'Initial speed and direction of an object', parent_quantity: velocity, vector: true, pack: mechanics_basics
meter_per_second.unit_of_measurement_quantities.find_or_create_by! quantity: initial_velocity

# Volume (Thermodynamics)
volume = Quantity.find_or_create_by! symbol: 'V', name: 'Volume', description: 'Three dimensional extent of an object', pack: thermodynamics_basics
cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'm<sup>3</sup>', name: 'cubic meter', base: true
cubic_meter.unit_of_measurement_quantities.find_or_create_by! quantity: volume

# Wavelength (Thermodynamics)
wavelength = Quantity.find_or_create_by! symbol: 'λ', name: 'Wavelength', description: 'Perpendicular distance between repeating units of a wave', pack: thermodynamics_basics
meter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
exameter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
petameter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
terameter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
gigameter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
megameter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
kilometer.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
hectometer.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
decameter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
decimeter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
centimeter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
milimeter.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
micrometer.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
nanometer.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
picometer.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
femtometer.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
attometer.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
zeptometer.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
yoctometer.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
inch.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
foot.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
yard.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength
miles.unit_of_measurement_quantities.find_or_create_by! quantity: wavelength

# Wavenumber (Thermodynamics)
wavenumber = Quantity.find_or_create_by! symbol: 'k<sub>λ</sub>', name: 'Wavenumber', description: 'Repetency or spacial frequency: the number of cycles per unit distance', pack: thermodynamics_basics
per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'm<sup>-1</sup>', name: 'per meter', base: true
per_meter.unit_of_measurement_quantities.find_or_create_by! quantity: wavenumber

# Weight (Mechanics)
weight = Quantity.find_or_create_by! symbol: 'w', name: 'Weight', description: 'Gravitational force on an object', pack: mechanics_basics
newton.unit_of_measurement_quantities.find_or_create_by! quantity: weight

# Work (Mechanics)
work = Quantity.find_or_create_by! symbol: 'W', name: 'Work', description: 'Transferred energy', pack: mechanics_basics
joule.unit_of_measurement_quantities.find_or_create_by! quantity: work





# Constants

## Vacuum speed of light (Quantum mechanics)
vacuum_speed_of_light = Constant.find_or_create_by! symbol: 'c<sub>0</sub>', name: 'Vacuum speed of light', unit_of_measurement: meter_per_second, pack: relativity
vacuum_speed_of_light.set_value = '2.99792458*10^8'
vacuum_speed_of_light.save!
vacuum_speed_of_light.update_attributes name: 'Lichtegeschwindigkeit im Vakuum', locale: :de

## Newtonian constant of gravitation (Mechanics)
cubic_meter_per_kilogram_square_second = UnitOfMeasurement.find_or_create_by! symbol: 'm<sup>3</sup> kg<sup>-1</sup> s<sup>-2</sup>', name: 'cubic meter per kilogram square second'
cubic_meter_per_kilogram_square_second.update_attributes name: 'Kubikmeter pro Kilogrammquadratsekunde', locale: :de
newtonian_constant_of_gravitation = Constant.find_or_create_by! symbol: 'G<sub>N</sub>', name: 'Newtonian constant of gravitation', unit_of_measurement: cubic_meter_per_kilogram_square_second, pack: mechanics_basics
newtonian_constant_of_gravitation.set_value = '6.673*10^-11'
newtonian_constant_of_gravitation.save!
newtonian_constant_of_gravitation.update_attributes name: 'Gravitationskonstante', locale: :de

## Planck constant (Quantum mechanics)
joule_second = UnitOfMeasurement.find_or_create_by! symbol: 'J s', name: 'joule second'
joule_second.update_attributes name: 'Joulesekunde', locale: :de
planck_constant = Constant.find_or_create_by! symbol: 'h', name: 'Planck constant', unit_of_measurement: joule_second, pack: quantum_mechanics_basics
planck_constant.set_value = '6.626069*10^-34'
planck_constant.save!
planck_constant.update_attributes name: 'Plancksches Wirkungsquantum', locale: :de

## Magnetic constant (Electromagnetism)
newton_per_square_ampere = UnitOfMeasurement.find_or_create_by! symbol: 'N A<sup>-2</sup>', name: 'newton per square ampere'
newton_per_square_ampere.update_attributes name: 'Newton pro Quadratampere', locale: :de
magnetic_constant = Constant.find_or_create_by! symbol: 'μ<sub>0</sub>', name: 'Magnetic constant', unit_of_measurement: newton_per_square_ampere, pack: magnetism
magnetic_constant.set_value = "4*#{Math::PI.to_s}*10^-7"
magnetic_constant.save!
magnetic_constant.update_attributes name: 'Magnetische Feldkonstante', locale: :de

## Electric constant (Electromagnetism)
electric_constant = Constant.find_or_create_by! symbol: 'ε<sub>0</sub>', name: 'Electric constant', unit_of_measurement: farad_per_meter, pack: electricity
electric_constant.set_value = '8.854188*10^-12'
electric_constant.save!
electric_constant.update_attributes name: 'Elektrische Feldkonstante', locale: :de

## Absolute zero (Thermodynamics)
absolute_zero = Constant.find_or_create_by! symbol: 'T<sub>a</sub>', name: 'Absolute zero', unit_of_measurement: kelvin, pack: thermodynamics_basics
absolute_zero.set_value = '0'
absolute_zero.save!
absolute_zero.update_attributes name: 'Absoluter Nullpunkt', locale: :de

## Unified atomic mass unit (Chemical physics)
unified_atomic_mass_unit = Constant.find_or_create_by! symbol: 'u', name: 'Unified atomic mass unit', unit_of_measurement: kilogram, pack: chemical_physics_basics
unified_atomic_mass_unit.set_value = '1.660540*10^-27'
unified_atomic_mass_unit.save!
unified_atomic_mass_unit.update_attributes name: 'Atomare Masseeinheit', locale: :de

## Avogadro constant (Chemical physics)
per_mole = UnitOfMeasurement.find_or_create_by! symbol: 'mol<sup>-1</sup>', name: 'per mole'
per_mole.update_attributes name: 'Pro Mol', locale: :de
avogadro_constant = Constant.find_or_create_by! symbol: 'N<sub>A</sub>', name: 'Avogadro constant', unit_of_measurement: per_mole, pack: chemical_physics_advanced
avogadro_constant.set_value = '6.022142*10^23'
avogadro_constant.save!
avogadro_constant.update_attributes name: 'Avogadro-Konstante', locale: :de

## Boltzmann constant (Thermodynamics)
boltzmann_constant = Constant.find_or_create_by! symbol: 'k', name: 'Boltzmann constant', unit_of_measurement: joule_per_kelvin, pack: thermodynamics_advanced
boltzmann_constant.set_value = '1.380650*10^-23'
boltzmann_constant.save!
boltzmann_constant.update_attributes name: 'Boltzmann-Konstante', locale: :de

## Compton wavelength of an electron (Quantum mechanics)
compton_wavelength_of_an_electron = Constant.find_or_create_by! symbol: 'λ<sub>C</sub>', name: 'Compton wavelength of an electron', unit_of_measurement: meter, pack: quantum_mechanics_basics
compton_wavelength_of_an_electron.set_value = '2.426310^-12'
compton_wavelength_of_an_electron.save!
compton_wavelength_of_an_electron.update_attributes name: 'Compton-Wellenlänge des Elektrons', locale: :de

## Faraday constant (Chemical physics)
ampere_second_per_mole = UnitOfMeasurement.find_or_create_by! symbol: 'A s mol<sup>-1</sup>', name: 'ampere second per mole'
ampere_second_per_mole.update_attributes name: 'Amperesekunde pro Mol', locale: :de
faraday_constant = Constant.find_or_create_by! symbol: 'F<sub>A</sub>', name: 'Faraday constant', unit_of_measurement: ampere_second_per_mole, pack: chemical_physics_advanced
faraday_constant.set_value = '9.648534*10^4'
faraday_constant.save!
faraday_constant.update_attributes name: 'Faraday-Konstante', locale: :de

## Loschmidt constant (Chemical physics)
per_cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'm<sup>-3</sup>', name: 'per cubic meter'
per_cubic_meter.update_attributes name: 'Pro Kubikmeter', locale: :de
loschmidt_constant = Constant.find_or_create_by! symbol: 'N<sub>L</sub>', name: 'Loschmidt constant', unit_of_measurement: per_cubic_meter, pack: chemical_physics_advanced
loschmidt_constant.set_value = '2.686778*10^25'
loschmidt_constant.save!
loschmidt_constant.update_attributes name: 'Loschmidt-Konstante', locale: :de

## Rydberg constant (Electromagnetism)
rydberg_constant = Constant.find_or_create_by! symbol: 'R<sub>H</sub>', name: 'Rydberg constant', unit_of_measurement: per_meter, pack: optics
rydberg_constant.set_value = '1.097373*10^7'
rydberg_constant.save!
rydberg_constant.update_attributes name: 'Rydberg-Konstante', locale: :de

## Rydberg frequency (Electromagnetism)
rydberg_frequency = Constant.find_or_create_by! symbol: 'R<sub>y</sub>', name: 'Rydberg frequency', unit_of_measurement: hertz, pack: optics
rydberg_frequency.set_value = '3.289841*10^15'
rydberg_frequency.save!
rydberg_frequency.update_attributes name: 'Rydberg-Frequenz', locale: :de

## Stefan-Boltzmann constant (Thermodynamics)
watt_per_square_meter_kelvin = UnitOfMeasurement.find_or_create_by! symbol: 'W m<sup>-2</sup> K<sup>-4</sup>', name: 'watt per square meter kelvin'
watt_per_square_meter_kelvin.update_attributes name: 'Watt pro Quadratmeterkelvin', locale: :de
stefan_boltzmann_constant = Constant.find_or_create_by! symbol: 'σ<sub>B</sub>', name: 'Stefan-Boltzmann constant', unit_of_measurement: watt_per_square_meter_kelvin, pack: thermodynamics_advanced
stefan_boltzmann_constant.set_value = '5.670400*10^-8'
stefan_boltzmann_constant.save!
stefan_boltzmann_constant.update_attributes name: 'Stefan-Boltzmann-Konstante', locale: :de

## Gas constant (Chemical physics)
joule_per_kelvin_mole = UnitOfMeasurement.find_or_create_by! symbol: 'J K<sup>-1</sup> mol<sup>-1</sup>', name: 'joule per kelvin mole'
joule_per_kelvin_mole.update_attributes name: 'Joule pro Kelvinmol', locale: :de
gas_constant = Constant.find_or_create_by! symbol: 'R<sub>0</sub>', name: 'Gas constant', unit_of_measurement: joule_per_kelvin_mole, pack: chemical_physics_advanced
gas_constant.set_value = '8.314472'
gas_constant.save!
gas_constant.update_attributes name: 'Universelle Gaskonstante', locale: :de

## Wien displacement law constant (Quantum mechanics)
meter_kelvin = UnitOfMeasurement.find_or_create_by! symbol: 'm K', name: 'meter kelvin'
meter_kelvin.update_attributes name: 'Meterkelvin', locale: :de
wien_displacement_law_constant = Constant.find_or_create_by! symbol: 'b<sub>energy</sub>', name: 'Wien displacement law constant', unit_of_measurement: meter_kelvin, pack: quantum_mechanics_basics
wien_displacement_law_constant.set_value = '2.897769*10^-3'
wien_displacement_law_constant.save!
wien_displacement_law_constant.update_attributes name: 'Wiensche Konstante', locale: :de

## Molar volume of an ideal gas (Chemical physics)
liter_per_mole = UnitOfMeasurement.find_or_create_by! symbol: 'l mol<sup>-1</sup>', name: 'liter per mole'
liter_per_mole.update_attributes name: 'Liter pro Mol', locale: :de
molar_volume_of_an_ideal_gas = Constant.find_or_create_by! symbol: 'V<sub>0</sub>', name: 'Molar volume of an ideal gas', unit_of_measurement: liter_per_mole, pack: chemical_physics_advanced
molar_volume_of_an_ideal_gas.set_value = '22.414'
molar_volume_of_an_ideal_gas.save!
molar_volume_of_an_ideal_gas.update_attributes name: 'Molares Normvolumen', locale: :de

## Standard acceleration of gravity (Mechanics)
standard_acceleration_of_gravity = Constant.find_or_create_by! symbol: 'g<sub>0</sub>', name: 'Standard acceleration of gravity', unit_of_measurement: meter_per_square_second, pack: mechanics_basics
standard_acceleration_of_gravity.set_value = '9.80665*10^-2'
standard_acceleration_of_gravity.save!
standard_acceleration_of_gravity.update_attributes name: 'Normfallbeschleunigung', locale: :de

## Standard temperature (Thermodynamics)
standard_temperature = Constant.find_or_create_by! symbol: 'T<sub>0</sub>', name: 'Standard temperature', unit_of_measurement: kelvin, pack: thermodynamics_basics
standard_temperature.set_value = '273.15'
standard_temperature.save!
standard_temperature.update_attributes name: 'Normtemperatur', locale: :de

## Elementary charge (Electromagnetism)
elementary_charge = Constant.find_or_create_by! symbol: 'e', name: 'Elementary charge', unit_of_measurement: coulomb, pack: electromagnetism_basics
elementary_charge.set_value = '1.60217646*10^-19'
elementary_charge.save!
elementary_charge.update_attributes name: 'Elementarladung', locale: :de

## Electron mass (Chemical physics)
electron_mass = Constant.find_or_create_by! symbol: 'm<sub>e</sub>', name: 'Electron mass', unit_of_measurement: kilogram, pack: chemical_physics_basics
electron_mass.set_value = '9.10938188*10^-31'
electron_mass.save!
electron_mass.update_attributes name: 'Ruhemasse eines Elektrons', locale: :de

## Neutron mass (Chemical physics)
neutron_mass = Constant.find_or_create_by! symbol: 'm<sub>n</sub>', name: 'Neutron mass', unit_of_measurement: kilogram, pack: chemical_physics_basics
neutron_mass.set_value = '1.67492716*10^-27'
neutron_mass.save!
neutron_mass.update_attributes name: 'Ruhemasse eines Neutrons', locale: :de

## Proton mass (Chemical physics)
proton_mass = Constant.find_or_create_by! symbol: 'm<sub>p</sub>', name: 'Proton mass', unit_of_measurement: kilogram, pack: chemical_physics_basics
proton_mass.set_value = '1.67262158*10^-27'
proton_mass.save!
proton_mass.update_attributes name: 'Ruhemasse eines Protons', locale: :de





# Equations

Equation.find_or_create_by! quantity: acceleration, equation: 'F / m'
Equation.find_or_create_by! quantity: force, equation: 'm * a'
Equation.find_or_create_by! quantity: mass, equation: 'F / a'

Equation.find_or_create_by! quantity: mass, equation: 'p / v'
Equation.find_or_create_by! quantity: momentum, equation: 'm * v'
Equation.find_or_create_by! quantity: velocity, equation: 'p / m'

Equation.find_or_create_by! quantity: velocity, equation: 'v_initial + a * t'
Equation.find_or_create_by! quantity: acceleration, equation: '( v - v_initial ) / t'
Equation.find_or_create_by! quantity: time, equation: '( v - v_initial ) / a'

Equation.find_or_create_by! quantity: velocity, equation: 'sqrt( v_initial^2 + 2 * a * s )'
Equation.find_or_create_by! quantity: initial_velocity, equation: 'sqrt( v^2 - 2 * a * s )'
Equation.find_or_create_by! quantity: distance_traveled, equation: '( v^2 - v_initial^2 ) / ( 2 * a )'
Equation.find_or_create_by! quantity: acceleration, equation: '( v^2 - v_initial^2 ) / ( 2 * s )'

Equation.find_or_create_by! quantity: distance_traveled, equation: 'v_initial * t + 1/2 * a * t^2'
Equation.find_or_create_by! quantity: initial_velocity, equation: '( s - 1/2 * a * t^2 ) / t'
Equation.find_or_create_by! quantity: acceleration, equation: '(2 * ( s - u * t )) / t^2'
# Equation.find_or_create_by! quantity: time, equation: '...'

Equation.find_or_create_by! quantity: impulse, equation: 'm * v - m * v_initial'
# Equation.find_or_create_by! quantity: initial_velocity, equation: '( m * v - Δp ) / m' ##### issue with Δp #####
# Equation.find_or_create_by! quantity: velocity, equation: '( Δp + m * v_initial ) / m' ##### issue with Δp #####
# Equation.find_or_create_by! quantity: mass, equation: '...'

Equation.find_or_create_by! quantity: work, equation: 'F * s'
Equation.find_or_create_by! quantity: distance_traveled, equation: 'W / F'
Equation.find_or_create_by! quantity: force, equation: 'W / s'

Equation.find_or_create_by! quantity: power, equation: 'W / t'
Equation.find_or_create_by! quantity: work, equation: 'P * t'
Equation.find_or_create_by! quantity: time, equation: 'W / P'

Equation.find_or_create_by! quantity: power, equation: 'E / t'
Equation.find_or_create_by! quantity: energy, equation: 'P * t'
Equation.find_or_create_by! quantity: time, equation: 'E / P'

Equation.find_or_create_by! quantity: density, equation: 'm * V'
# Equation.find_or_create_by! quantity: mass, equation: 'ρ / V' ##### issue with ρ #####
# Equation.find_or_create_by! quantity: volume, equation: 'ρ / m' ##### issue with ρ #####

Equation.find_or_create_by! quantity: pressure, equation: 'F / A'
Equation.find_or_create_by! quantity: force, equation: 'p_f * A'
Equation.find_or_create_by! quantity: area, equation: 'F / p_f'

Equation.find_or_create_by! quantity: electric_potential, equation: 'I * R'
Equation.find_or_create_by! quantity: electric_current, equation: 'U / R'
Equation.find_or_create_by! quantity: electrical_resistance, equation: 'U / I'

Equation.find_or_create_by! quantity: power, equation: 'I * U'
Equation.find_or_create_by! quantity: electric_current, equation: 'P / U'
Equation.find_or_create_by! quantity: electric_potential, equation: 'P / I'




# Translations

## Packs & Categories
mechanics.update_attributes name: 'Mechanik', description: 'Beschreibung', locale: :de
mechanics_basics.update_attributes name: 'Mechanik (Basis)', description: 'Beschreibung', locale: :de
kinematics.update_attributes name: 'Kinematik', description: 'Beschreibung', locale: :de
dynamics.update_attributes name: 'Dynamik', description: 'Beschreibung', locale: :de
thermodynamics.update_attributes name: 'Themodynamik', description: 'Beschreibung', locale: :de
thermodynamics_basics.update_attributes name: 'Themodynamik (Basis)', description: 'Beschreibung', locale: :de
thermodynamics_advanced.update_attributes name: 'Themodynamik (Erweitert)', description: 'Beschreibung', locale: :de
electromagnetism.update_attributes name: 'Elektromagnetismus', description: 'Beschreibung', locale: :de
electromagnetism_basics.update_attributes name: 'Elektromagnetismus (Basis)', description: 'Beschreibung', locale: :de
electricity.update_attributes name: 'Elektrizität', description: 'Beschreibung', locale: :de
magnetism.update_attributes name: 'Magnetismus', description: 'Beschreibung', locale: :de
optics.update_attributes name: 'Optik', description: 'Beschreibung', locale: :de
quantum_mechanics.update_attributes name: 'Quantenmachanik', description: 'Beschreibung', locale: :de
relativity.update_attributes name: 'Relativität', description: 'Beschreibung', locale: :de
quantum_mechanics_basics.update_attributes name: 'Quantenmachanik (Basis)', description: 'Beschreibung', locale: :de
chemical_physics.update_attributes name: 'Chemische Physik', description: 'Beschreibung', locale: :de
chemical_physics_basics.update_attributes name: 'Chemische Physik (Basis)', description: 'Beschreibung', locale: :de
chemical_physics_advanced.update_attributes name: 'Chemische Physik (Erweitert)', description: 'Beschreibung', locale: :de

## Length
length.update_attributes name: 'Länge', description: 'Die eindimensionale Ausdehnung eines Gegenstandes', locale: :de
meter.update_attributes name: 'Meter', locale: :de
exameter.update_attributes name: 'Exameter', locale: :de
petameter.update_attributes name: 'Petameter', locale: :de
terameter.update_attributes name: 'Terameter', locale: :de
gigameter.update_attributes name: 'Gigameter', locale: :de
megameter.update_attributes name: 'Megameter', locale: :de
kilometer.update_attributes name: 'Kilometer', locale: :de
hectometer.update_attributes name: 'Hektometer', locale: :de
decameter.update_attributes name: 'Dekameter', locale: :de
decimeter.update_attributes name: 'Dezimeter', locale: :de
centimeter.update_attributes name: 'Zentimeter', locale: :de
milimeter.update_attributes name: 'Milimeter', locale: :de
micrometer.update_attributes name: 'Mikrometer', locale: :de
nanometer.update_attributes name: 'Nanometer', locale: :de
picometer.update_attributes name: 'Pikometer', locale: :de
femtometer.update_attributes name: 'Femtometer', locale: :de
attometer.update_attributes name: 'Attometer', locale: :de
zeptometer.update_attributes name: 'Zeptometer', locale: :de
yoctometer.update_attributes name: 'Yoktometer', locale: :de
inch.update_attributes name: 'Zoll', locale: :de
foot.update_attributes name: 'Fuß', locale: :de
yard.update_attributes name: 'Yard', locale: :de
miles.update_attributes name: 'Meilen', locale: :de
### Distance traveled
distance_traveled.update_attributes name: 'Zurückgelegte Strecke', description: 'Von einem Objekt zurückgelegte Strecke', locale: :de
meter.update_attributes name: 'Meter', locale: :de

## Mass
mass.update_attributes name: 'Masse', description: 'Ein Maß für Widerstand gegen Beschleunigung', locale: :de
kilogram.update_attributes name: 'Kilogramm', locale: :de
exagram.update_attributes name: 'Exagramm', locale: :de
petagram.update_attributes name: 'Petagramm', locale: :de
teragram.update_attributes name: 'Teragramm', locale: :de
gigagram.update_attributes name: 'Gigagramm', locale: :de
megagram.update_attributes name: 'Megagramm', locale: :de
gram.update_attributes name: 'Gramm', locale: :de
miligram.update_attributes name: 'Miligramm', locale: :de
microgram.update_attributes name: 'Mikrogramm', locale: :de
nanogram.update_attributes name: 'Nanogramm', locale: :de
picogram.update_attributes name: 'Pikogramm', locale: :de
femtogram.update_attributes name: 'Femtogramm', locale: :de
attogram.update_attributes name: 'Attogramm', locale: :de
zeptogram.update_attributes name: 'Zeptogramm', locale: :de
yoctogram.update_attributes name: 'Yoktogramm', locale: :de
atomic_mass.update_attributes name: 'Atomare Masse', locale: :de
pound.update_attributes name: 'Pfund', locale: :de

## Time
time.update_attributes name: 'Zeit', description: 'Die Dauer eines Ereignisses', locale: :de
second.update_attributes name: 'Sekunde', locale: :de
milisecond.update_attributes name: 'Milisekunde', locale: :de
microsecond.update_attributes name: 'Mikrosekunde', locale: :de
nanosecond.update_attributes name: 'Nanosekunde', locale: :de
picosecond.update_attributes name: 'Pikosekunde', locale: :de
femtosecond.update_attributes name: 'Femtosekunde', locale: :de
attosecond.update_attributes name: 'Attosekunde', locale: :de
zeptosecond.update_attributes name: 'Zeptosekunde', locale: :de
yoctosecond.update_attributes name: 'Yoktosekunde', locale: :de
minute.update_attributes name: 'Minute', locale: :de
hour.update_attributes name: 'Stunde', locale: :de
day.update_attributes name: 'Tag', locale: :de
week.update_attributes name: 'Woche', locale: :de
year.update_attributes name: 'Jahr', locale: :de

## Electric current
electric_current.update_attributes name: 'Stromstärke', description: 'Durchflussrate der elektrischen Ladung pro Zeiteinheit', locale: :de
ampere.update_attributes name: 'Ampere', locale: :de
miliampere.update_attributes name: 'Miliampere', locale: :de
microampere.update_attributes name: 'Mikroampere', locale: :de
nanoampere.update_attributes name: 'Nanoampere', locale: :de
picoampere.update_attributes name: 'Pikoampere', locale: :de
femtoampere.update_attributes name: 'Femtoampere', locale: :de
attoampere.update_attributes name: 'Attoampere', locale: :de
zeptoampere.update_attributes name: 'Zeptoampere', locale: :de
yoctoampere.update_attributes name: 'Yoktoampere', locale: :de

## Temperature
temperature.update_attributes name: 'Temperatur', description: 'Durchschnittliche kinetische Energie pro Freiheitsgrad eines Systems', locale: :de
kelvin.update_attributes name: 'Kelvin', locale: :de
degree_celcius.update_attributes name: 'Grad Celcius', locale: :de
degree_fahrenheit.update_attributes name: 'Grad Fahrenheit', locale: :de

## Amount of substance
amount_of_substance.update_attributes name: 'Stoffmenge', description: 'Anzahl der Partikel im Vergleich zur Anzahl der Atome in 0,012 kg 12C', locale: :de
mole.update_attributes name: 'Mol', locale: :de

## Luminous intensity
luminous_intensity.update_attributes name: 'Lichtstärke', description: 'Wellenlängengewichtete Leistung des emittierten Lichts pro Raumwinkeleinheit', locale: :de
candela.update_attributes name: 'Candela', locale: :de


## Acceleration
acceleration.update_attributes name: 'Beschleunigung', description: 'Änderung der Geschwindigkeit pro Zeiteinheit', locale: :de
meter_per_square_second.update_attributes name: 'Meter pro Quadratsekunde', locale: :de

## Angular acceleration
angular_acceleration.update_attributes name: 'Winkelbeschleunigung', description: 'Änderung der Winkelgeschwindigkeit pro Zeiteinheit', locale: :de
rad_per_square_second.update_attributes name: 'Rad pro Quadratsekunde', locale: :de

## Angular velocity
angular_velocity.update_attributes name: 'Winkelgeschwindigkeit', description: 'Der Winkel, der in einer Ebene durch ein Segment erhöht wird, das ein Objekt und einen Referenzpunkt pro Zeiteinheit verbindet', locale: :de
rad_per_second.update_attributes name: 'Rad pro Sekunde', locale: :de

## Area
area.update_attributes name: 'Fläche', description: 'Ausmaß einer Oberfläche', locale: :de
square_meter.update_attributes name: 'Quadratmeter', locale: :de

## Area density
area_density.update_attributes name: 'Massenbelegung', description: 'Masse pro Flächeneinheit', locale: :de
kilogram_per_square_meter.update_attributes name: 'Kilogramm pro Quadratmeter', locale: :de

## Capacitance
capacitance.update_attributes name: 'Kapazität', description: 'Gespeicherte Ladung pro elektrischem Potential', locale: :de
farad.update_attributes name: 'Farad', locale: :de

## Chemical potential
chemical_potential.update_attributes name: 'Chemisches Potential', description: 'Energie pro Einheitsänderung der Stoffmenge', locale: :de
joule_per_mole.update_attributes name: 'Joule pro Mol', locale: :de

## Current density
current_density.update_attributes name: 'Elektrische Stromdichte', description: 'Elektrischer Strom pro Querschnittsfläche', locale: :de
ampere_per_square_meter.update_attributes name: 'Ampere pro Quadratmeter', locale: :de

## Electric charge
electric_charge.update_attributes name: 'Elektrische Ladung', description: 'Die Kraft pro Einheit der elektrischen Feldstärke', locale: :de
coulomb.update_attributes name: 'Coulomb', locale: :de

## Electric charge density
electric_charge_density.update_attributes name: 'Elektrische Ladungsdichte', description: 'Die Kraft pro Einheit der elektrischen Feldstärke', locale: :de
coulomb_per_cubic_meter.update_attributes name: 'Coulomb pro Kubikmeter', locale: :de

## Electric displacement
electric_displacement.update_attributes name: 'Dielektrische Verschiebung', description: 'Stärke der elektrischen Verschiebung', locale: :de
coulomb_per_square_meter.update_attributes name: 'Coulomb pro Quadratmeter', locale: :de

## Electric field strength
electric_field_strength.update_attributes name: 'Elektrische Feldstärke', description: 'Stärke des elektrischen Feldes', locale: :de
volt_per_meter.update_attributes name: 'Volt pro Meter', locale: :de

## Electrical conductance
electrical_conductance.update_attributes name: 'Elektrischer Materialwiderstand', description: 'Maß der Leichtigkeit, mit der Strom durch ein Material fließt', locale: :de
siemens.update_attributes name: 'Siemens', locale: :de

## Electrical conductivity
electrical_conductivity.update_attributes name: 'Elektrische Leitfähigkeit', description: 'Maß der Fähigkeit eines Materials, elektrischen Strom zu leiten', locale: :de
siemens_per_meter.update_attributes name: 'Siemens pro Meter', locale: :de

## Electric potential
electric_potential.update_attributes name: 'Elektrische Spannung', description: 'Energie, die benötigt wird, um eine Einheitsladung von einem Referenzpunkt durch ein elektrisches Feld zu bewegen', locale: :de
volt.update_attributes name: 'Volt', locale: :de

## Electrical resistance
electrical_resistance.update_attributes name: 'Elektrischer Widerstand', description: 'Elektrisches Potential pro elektrischem Strom', locale: :de
ohm.update_attributes name: 'Ohm', locale: :de

## Electrical resistivity
electrical_resistivity.update_attributes name: 'Elektrischer Mengenwiderstand', description: 'Mengeneigenschaftsäquivalent des elektrischen Widerstandes', locale: :de
ohm_meter.update_attributes name: 'Ohmmeter', locale: :de

## Energy
energy.update_attributes name: 'Energie', description: 'Arbeitskapazität eines Körpers oder Systems', locale: :de
joule.update_attributes name: 'Joule', locale: :de

## Energy density
energy_density.update_attributes name: 'Energiedichte', description: 'Energie pro Volumeneinheit', locale: :de
joule_per_cubic_meter.update_attributes name: 'Joule pro Kubikmeter', locale: :de

## Entropy
entropy.update_attributes name: 'Entropie', description: 'Logarithmisches Maß für die Anzahl der verfügbaren Zustände eines Systems', locale: :de
joule_per_kelvin.update_attributes name: 'Joule pro Kelvin', locale: :de

## Force
force.update_attributes name: 'Kraft', description: 'Übertragung eines Impulses pro Zeiteinheit', locale: :de
newton.update_attributes name: 'Newton', locale: :de

## Frequency
frequency.update_attributes name: 'Frequenz', description: 'Anzahl von (periodischen) Ereignissen pro Zeiteinheit', locale: :de
hertz.update_attributes name: 'Hertz', locale: :de

## Heat
heat.update_attributes name: 'Wärmemenge', description: 'Wärmeenergie', locale: :de
joule.update_attributes name: 'Joule', locale: :de

## Heat capacity
heat_capacity.update_attributes name: 'Wärmekapazität', description: 'Energie pro Temperaturänderung', locale: :de
joule_per_kelvin.update_attributes name: 'Joule pro Kelvin', locale: :de

## Heat flux density
heat_flux_density.update_attributes name: 'Wärmestromdichte', description: 'Wärmefluss pro Zeiteinheit und Flächeneinheit', locale: :de
watt_per_square_meter.update_attributes name: 'Watt pro Quadratmeter', locale: :de

## Illuminance
illuminance.update_attributes name: 'Beleuchtungsstärke', description: 'Lichtstrom pro Flächeneinheit', locale: :de
lux.update_attributes name: 'Lux', locale: :de

## Impedance
impedance.update_attributes name: 'Impedanz', description: 'Widerstand gegen einen Wechselstrom einer bestimmten Frequenz, einschließlich der Auswirkung auf die Phase', locale: :de
ohm.update_attributes name: 'Ohm', locale: :de

## Impulse
impulse.update_attributes name: 'Impuls', description: 'Übertragene Dynamik', locale: :de
newton_second.update_attributes name: 'Newtonsekunde', locale: :de

## Inductance
inductance.update_attributes name: 'Induktivität', description: 'Magnetischer Fluss, der pro Einheitsstrom durch eine Schaltung erzeugt wird', locale: :de
henry.update_attributes name: 'Henry', locale: :de

## Intensity
intensity.update_attributes name: 'Intensität', description: 'Leistung pro Querschnittseinheit', locale: :de
watt_per_square_meter.update_attributes name: 'Watt pro Quadratmeter', locale: :de

## Luminous flux
luminous_flux.update_attributes name: 'Lichtstrom', description: 'Wahrgenommene Kraft einer Lichtquelle', locale: :de
lumen.update_attributes name: 'Lumen', locale: :de

## Magnetic field strength
magnetic_field_strength.update_attributes name: 'Magnetische Feldstärke', description: 'Stärke eines Magnetfeldes', locale: :de
ampere_per_meter.update_attributes name: 'Ampere pro Meter', locale: :de

## Magnetic flux
magnetic_flux.update_attributes name: 'Magnetischer Fluss', description: 'Maß des Magnetismus unter Berücksichtigung der Stärke und des Ausmaßes eines Magnetfeldes', locale: :de
weber.update_attributes name: 'Weber', locale: :de

## Magnetic flux density
magnetic_flux_density.update_attributes name: 'Magnetische Flussdichte', description: 'Maß für die Stärke des Magnetfeldes', locale: :de
tesla.update_attributes name: 'Tesla', locale: :de

## Magnetization
magnetization.update_attributes name: 'Magnetisierung', description: 'Menge des magnetischen Momentes pro Volumeneinheit', locale: :de
ampere_per_meter.update_attributes name: 'Ampere pro Meter', locale: :de

## Density
density.update_attributes name: 'Dichte', description: 'Masse pro Volumeneinheit', locale: :de
kilogram_per_cubic_meter.update_attributes name: 'Kilogramm pro Kubikmeter', locale: :de

## Molar concentration
molar_concentration.update_attributes name: 'Stoffmengenkonzentration', description: 'Menge einer Substanz pro Volumeneinheit', locale: :de
mole_per_cubic_meter.update_attributes name: 'Mol pro Kubikmeter', locale: :de

## Molar heat capacity
molar_heat_capacity.update_attributes name: 'Wärmekapazität', description: 'Wärmekapazität eines Materials pro Stoffmenge einer Substanz', locale: :de
joule_per_kelvin_mole.update_attributes name: 'Joule pro Kelvinmol', locale: :de

## Moment of inertia
moment_of_inertia.update_attributes name: 'Trägheitsmoment', description: 'Trägheit eines Objekts in Bezug auf die Winkelbeschleunigung', locale: :de
kilogram_per_square_meter.update_attributes name: 'Kilogramm pro Quadratmeter', locale: :de

## Momentum
momentum.update_attributes name: 'Momentum', description: 'Produkt der Masse und Geschwindigkeit eines Objekts', locale: :de
newton_second.update_attributes name: 'Newtonsekunde', locale: :de

## Permeability
permeability.update_attributes name: 'Magnetische Permeabilität', description: 'Maß für den Einfluss eines externen Magnetfeldes auf die Magnetisierung eines Materials', locale: :de
henry_per_meter.update_attributes name: 'Henry pro Meter', locale: :de

## Permittivity
permittivity.update_attributes name: 'Permittivität', description: 'Maß für den Einfluss eines externen Magnetfeldes auf die Polarisation eines Materials', locale: :de
farad_per_meter.update_attributes name: 'Farad pro Meter', locale: :de

## Plain angle
plain_angle.update_attributes name: 'Winkel', description: 'Verhältnis von Kreisbogenlänge zu Radius', locale: :de
radian.update_attributes name: 'Radiant', locale: :de

## Power
power.update_attributes name: 'Leistung', description: 'Übertragungsrate von Energie pro Zeiteinheit', locale: :de
watt.update_attributes name: 'Watt', locale: :de

## Pressure
pressure.update_attributes name: 'Druck', description: 'Kraft pro Flächeneinheit', locale: :de
pascal.update_attributes name: 'Pascal', locale: :de

## Reaction rate
reaction_rate.update_attributes name: 'Reaktionsgeschwindigkeit', description: 'Geschwindigkeit einer chemischen Reaktion', locale: :de
mole_per_cubic_meter_second.update_attributes name: 'Mol pro Kubikmetersekunde', locale: :de

## Speed
speed.update_attributes name: 'Geschwindigkeitsbetrag', description: 'Zurückgelegte Distanz pro Zeiteinheit. Die erste Ableitung der Position.', locale: :de
meter_per_second.update_attributes name: 'Meter pro Sekunde', locale: :de

## Spin
spin.update_attributes name: 'Drehimpuls', description: 'Quantenmechanisch definierter Drehimpuls eines Teilchens', locale: :de
kilogram_square_meter_per_second.update_attributes name: 'Kilogramm-Quadratmeter pro Sekunde', locale: :de

## Stress
stress.update_attributes name: 'Mechanische Spannung', description: 'Kraft pro Einheitsorientierter Oberfläche', locale: :de
pascal.update_attributes name: 'Pascal', locale: :de

## Surface tension
surface_tension.update_attributes name: 'Oberflächenspannung', description: 'Energieänderung pro Flächeneinheit', locale: :de
joule_per_square_meter.update_attributes name: 'Joule pro Quadratmeter', locale: :de

## Thermal conductivity
thermal_conductivity.update_attributes name: 'Wärmeleitfähigkeit', description: 'Maß für die Leichtigkeit, mit der ein Material Wärme leitet', locale: :de
watt_per_meter_kelvin.update_attributes name: 'Watt pro Meterkelvin', locale: :de

## Torque
torque.update_attributes name: 'Drehmoment', description: 'Produkt einer Kraft und der senkrechte Abstand der Kraft von dem Punkt, um den sich das Objekt dreht', locale: :de
newton_meter.update_attributes name: 'Newtonmeter', locale: :de

## Velocity
velocity.update_attributes name: 'Geschwindigkeit', description: 'Geschwindigkeit und Richtung eines Objekts', locale: :de
meter_per_second.update_attributes name: 'Meter pro Sekunde', locale: :de

## Volume
volume.update_attributes name: 'Volumen', description: 'Dreidimensionale Ausdehnung eines Objekts', locale: :de
cubic_meter.update_attributes name: 'Kubikmeter', locale: :de
### Initial velocity
initial_velocity.update_attributes name: 'Anfangsgeschwindigkeit', description: 'Anfangsgeschwindigkeit und Richtung eines Objekts', locale: :de
meter_per_second.update_attributes name: 'Meter pro Sekunde', locale: :de

## Wavelength
wavelength.update_attributes name: 'Wellenlänge', description: 'Senkrechter Abstand zwischen sich wiederholenden Einheiten einer Welle', locale: :de
meter.update_attributes name: 'Meter', locale: :de

## Wavenumber
wavenumber.update_attributes name: 'Wellenzahl', description: 'Repetitions- oder räumliche Frequenz. Die Anzahl der Zyklen pro Entfernungseinheit.', locale: :de
per_meter.update_attributes name: 'Pro Meter', locale: :de

## Weight
weight.update_attributes name: 'Gewichtskraft', description: 'Gravitationskraft auf ein Objekt', locale: :de
newton.update_attributes name: 'Newton', locale: :de

## Work
work.update_attributes name: 'Arbeit', description: 'Übertragene Energie', locale: :de
joule.update_attributes name: 'Joule', locale: :de
