# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# Demo
user = User.create email: 'demo@example.com', password: 'password'
user&.encrypted_password




# Length
length = Quantity.find_or_create_by! symbol: 'l', name: 'Length', description: 'The one-dimensional extent of an object'
meter = UnitOfMeasurement.find_or_create_by! symbol: 'm', name: 'meter', base: true
meter.connected_quantities.build quantity: length
exameter = UnitOfMeasurement.find_or_create_by! symbol: 'Em', name: 'exameter', to_base: '*1000000000000000000'
exameter.connected_quantities.build quantity: length
petameter = UnitOfMeasurement.find_or_create_by! symbol: 'Pm', name: 'petameter', to_base: '*1000000000000000'
petameter.connected_quantities.build quantity: length
terameter = UnitOfMeasurement.find_or_create_by! symbol: 'Tm', name: 'terameter', to_base: '*1000000000000'
terameter.connected_quantities.build quantity: length
gigameter = UnitOfMeasurement.find_or_create_by! symbol: 'Gm', name: 'gigameter', to_base: '*1000000000'
gigameter.connected_quantities.build quantity: length
megameter = UnitOfMeasurement.find_or_create_by! symbol: 'Mm', name: 'megameter', to_base: '*1000000'
megameter.connected_quantities.build quantity: length
kilometer = UnitOfMeasurement.find_or_create_by! symbol: 'km', name: 'kilometer', to_base: '*1000'
kilometer.connected_quantities.build quantity: length
hectometer = UnitOfMeasurement.find_or_create_by! symbol: 'hm', name: 'hectometer', to_base: '*100'
hectometer.connected_quantities.build quantity: length
decameter = UnitOfMeasurement.find_or_create_by! symbol: 'dam', name: 'decameter', to_base: '*10'
decameter.connected_quantities.build quantity: length
decimeter = UnitOfMeasurement.find_or_create_by! symbol: 'dm', name: 'decimeter', to_base: '/10'
decimeter.connected_quantities.build quantity: length
centimeter = UnitOfMeasurement.find_or_create_by! symbol: 'cm', name: 'centimeter', to_base: '/100'
centimeter.connected_quantities.build quantity: length
milimeter = UnitOfMeasurement.find_or_create_by! symbol: 'mm', name: 'milimeter', to_base: '/1000'
milimeter.connected_quantities.build quantity: length
micrometer = UnitOfMeasurement.find_or_create_by! symbol: 'µm', name: 'micrometer', to_base: '/1000000'
micrometer.connected_quantities.build quantity: length
nanometer = UnitOfMeasurement.find_or_create_by! symbol: 'nm', name: 'nanometer', to_base: '/1000000000'
nanometer.connected_quantities.build quantity: length
picometer = UnitOfMeasurement.find_or_create_by! symbol: 'pm', name: 'picometer', to_base: '/1000000000000'
picometer.connected_quantities.build quantity: length
femtometer = UnitOfMeasurement.find_or_create_by! symbol: 'fm', name: 'femtometer', to_base: '/1000000000000000'
femtometer.connected_quantities.build quantity: length
attometer = UnitOfMeasurement.find_or_create_by! symbol: 'am', name: 'attometer', to_base: '/1000000000000000000'
attometer.connected_quantities.build quantity: length
zeptometer = UnitOfMeasurement.find_or_create_by! symbol: 'zm', name: 'zeptometer', to_base: '/1000000000000000000000'
zeptometer.connected_quantities.build quantity: length
yoctometer = UnitOfMeasurement.find_or_create_by! symbol: 'ym', name: 'yoctometer', to_base: '/1000000000000000000000000'
yoctometer.connected_quantities.build quantity: length
inch = UnitOfMeasurement.find_or_create_by! symbol: 'in', name: 'inch', to_base: '/0.254'
inch.connected_quantities.build quantity: length
foot = UnitOfMeasurement.find_or_create_by! symbol: 'ft', name: 'foot', to_base: '/3.048'
foot.connected_quantities.build quantity: length
yard = UnitOfMeasurement.find_or_create_by! symbol: 'yd', name: 'yard', to_base: '/9.144'
yard.connected_quantities.build quantity: length
miles = UnitOfMeasurement.find_or_create_by! symbol: 'mi', name: 'miles', to_base: '/16093.44'
miles.connected_quantities.build quantity: length

# Mass
mass = Quantity.find_or_create_by! symbol: 'm', name: 'Mass', description: 'A measure of resistance to acceleration'
kilogram = UnitOfMeasurement.find_or_create_by! symbol: 'kg', name: 'kilogram', base: true
kilogram.connected_quantities.build quantity: mass
exagram = UnitOfMeasurement.find_or_create_by! symbol: 'Eg', name: 'exagram', to_base: '*1000000000000000'
exagram.connected_quantities.build quantity: mass
petagram = UnitOfMeasurement.find_or_create_by! symbol: 'Pg', name: 'petagram', to_base: '*1000000000000'
petagram.connected_quantities.build quantity: mass
teragram = UnitOfMeasurement.find_or_create_by! symbol: 'Tg', name: 'teragram', to_base: '*1000000000'
teragram.connected_quantities.build quantity: mass
gigagram = UnitOfMeasurement.find_or_create_by! symbol: 'Gg', name: 'gigagram', to_base: '*1000000'
gigagram.connected_quantities.build quantity: mass
megagram = UnitOfMeasurement.find_or_create_by! symbol: 'Mg', name: 'megagram', to_base: '*1000'
megagram.connected_quantities.build quantity: mass
gram = UnitOfMeasurement.find_or_create_by! symbol: 'g', name: 'gram', to_base: '/1000'
gram.connected_quantities.build quantity: mass
miligram = UnitOfMeasurement.find_or_create_by! symbol: 'mg', name: 'miligram', to_base: '/1000000'
miligram.connected_quantities.build quantity: mass
microgram = UnitOfMeasurement.find_or_create_by! symbol: 'µg', name: 'microgram', to_base: '/1000000000'
microgram.connected_quantities.build quantity: mass
nanogram = UnitOfMeasurement.find_or_create_by! symbol: 'ng', name: 'nanogram', to_base: '/10000000000000'
nanogram.connected_quantities.build quantity: mass
picogram = UnitOfMeasurement.find_or_create_by! symbol: 'pg', name: 'picogram', to_base: '/1000000000000000'
picogram.connected_quantities.build quantity: mass
femtogram = UnitOfMeasurement.find_or_create_by! symbol: 'fg', name: 'femtogram', to_base: '/1000000000000000000'
femtogram.connected_quantities.build quantity: mass
attogram = UnitOfMeasurement.find_or_create_by! symbol: 'ag', name: 'attogram', to_base: '/1000000000000000000000'
attogram.connected_quantities.build quantity: mass
zeptogram = UnitOfMeasurement.find_or_create_by! symbol: 'zg', name: 'zeptogram', to_base: '/1000000000000000000000000'
zeptogram.connected_quantities.build quantity: mass
yoctogram = UnitOfMeasurement.find_or_create_by! symbol: 'yg', name: 'yoctogram', to_base: '/1000000000000000000000000000'
yoctogram.connected_quantities.build quantity: mass
atomic_mass = UnitOfMeasurement.find_or_create_by! symbol: 'u', name: 'atomic mass', to_base: '/0.000000000000000000000000166054'
atomic_mass.connected_quantities.build quantity: mass
pound = UnitOfMeasurement.find_or_create_by! symbol: 'lbs', name: 'pound', to_base: '/4.53592'
pound.connected_quantities.build quantity: mass

# Time
time = Quantity.find_or_create_by! symbol: 't', name: 'Time', description: 'The duration of an event'
second = UnitOfMeasurement.find_or_create_by! symbol: 's', name: 'second', base: true
second.connected_quantities.build quantity: time
milisecond = UnitOfMeasurement.find_or_create_by! symbol: 'ms', name: 'milisecond', to_base: '/1000'
milisecond.connected_quantities.build quantity: time
microsecond = UnitOfMeasurement.find_or_create_by! symbol: 'µs', name: 'microsecond', to_base: '/1000000'
microsecond.connected_quantities.build quantity: time
nanosecond = UnitOfMeasurement.find_or_create_by! symbol: 'ns', name: 'nanosecond', to_base: '/1000000000'
nanosecond.connected_quantities.build quantity: time
picosecond = UnitOfMeasurement.find_or_create_by! symbol: 'ps', name: 'picosecond', to_base: '/1000000000000'
picosecond.connected_quantities.build quantity: time
femtosecond = UnitOfMeasurement.find_or_create_by! symbol: 'fs', name: 'femtosecond', to_base: '/1000000000000000'
femtosecond.connected_quantities.build quantity: time
attosecond = UnitOfMeasurement.find_or_create_by! symbol: 'as', name: 'attosecond', to_base: '/1000000000000000000'
attosecond.connected_quantities.build quantity: time
zeptosecond = UnitOfMeasurement.find_or_create_by! symbol: 'zs', name: 'zeptosecond', to_base: '/1000000000000000000000'
zeptosecond.connected_quantities.build quantity: time
yoctosecond = UnitOfMeasurement.find_or_create_by! symbol: 'ys', name: 'yoctosecond', to_base: '/1000000000000000000000000'
yoctosecond.connected_quantities.build quantity: time
minute = UnitOfMeasurement.find_or_create_by! symbol: 'min', name: 'minute', to_base: '*60'
minute.connected_quantities.build quantity: time
hour = UnitOfMeasurement.find_or_create_by! symbol: 'h', name: 'hour', to_base: '*3600'
hour.connected_quantities.build quantity: time
day = UnitOfMeasurement.find_or_create_by! symbol: 'd', name: 'day', to_base: '*86400'
day.connected_quantities.build quantity: time
week = UnitOfMeasurement.find_or_create_by! symbol: 'week', name: 'week', to_base: '*604800'
week.connected_quantities.build quantity: time
year = UnitOfMeasurement.find_or_create_by! symbol: 'year', name: 'year', to_base: '*31557600'
year.connected_quantities.build quantity: time

# Electric current
electric_current = Quantity.find_or_create_by! symbol: 'I', name: 'Electric current', description: 'Rate of flow of electrical charge per unit time'
ampere = UnitOfMeasurement.find_or_create_by! symbol: 'A', name: 'ampere', base: true
ampere.connected_quantities.build quantity: electric_current
miliampere = UnitOfMeasurement.find_or_create_by! symbol: 'mA', name: 'miliampere', to_base: '/1000'
miliampere.connected_quantities.build quantity: electric_current
microampere = UnitOfMeasurement.find_or_create_by! symbol: 'µA', name: 'microampere', to_base: '/1000000'
microampere.connected_quantities.build quantity: electric_current
nanoampere = UnitOfMeasurement.find_or_create_by! symbol: 'nA', name: 'nanoampere', to_base: '/1000000000'
nanoampere.connected_quantities.build quantity: electric_current
picoampere = UnitOfMeasurement.find_or_create_by! symbol: 'pA', name: 'picoampere', to_base: '/1000000000000'
picoampere.connected_quantities.build quantity: electric_current
femtoampere = UnitOfMeasurement.find_or_create_by! symbol: 'fA', name: 'femtoampere', to_base: '/1000000000000000'
femtoampere.connected_quantities.build quantity: electric_current
attoampere = UnitOfMeasurement.find_or_create_by! symbol: 'aA', name: 'attoampere', to_base: '/1000000000000000000'
attoampere.connected_quantities.build quantity: electric_current
zeptoampere = UnitOfMeasurement.find_or_create_by! symbol: 'zA', name: 'zeptoampere', to_base: '/1000000000000000000000'
zeptoampere.connected_quantities.build quantity: electric_current
yoctoampere = UnitOfMeasurement.find_or_create_by! symbol: 'yA', name: 'yoctoampere', to_base: '/1000000000000000000000000'
yoctoampere.connected_quantities.build quantity: electric_current

# Temperature
temperature = Quantity.find_or_create_by! symbol: 'T', name: 'Temperature', description: 'Average kinetic energy per degree of freedom of a system'
kelvin = UnitOfMeasurement.find_or_create_by! symbol: 'K', name: 'kelvin', base: true
kelvin.connected_quantities.build quantity: temperature
celcius = UnitOfMeasurement.find_or_create_by! symbol: '°C', name: 'degree celcius', to_base: '+273.15'
celcius.connected_quantities.build quantity: temperature
fahrenheit = UnitOfMeasurement.find_or_create_by! symbol: '°F', name: 'degree fahrenheit', to_base: '*(5/9)+459.67*(5/9)', from_base: '*(5/9)+459.67*(5/9)' ##### UPDATE CONVERSIONS ######
fahrenheit.connected_quantities.build quantity: temperature

# Amount of substance
amount_of_substance = Quantity.find_or_create_by! symbol: 'n', name: 'Amount of substance', description: 'Number of particles compared to the number of atoms in 0.012 kg of 12C'
mole = UnitOfMeasurement.find_or_create_by! symbol: 'mol', name: 'mole', base: true
mole.connected_quantities.build quantity: amount_of_substance

# Luminous intensity
luminous_intensity = Quantity.find_or_create_by! symbol: 'L', name: 'Luminous intensity', description: 'Wavelength-weighted power of emitted light per unit solid angle'
candela = UnitOfMeasurement.find_or_create_by! symbol: 'cd', name: 'candela', base: true
candela.connected_quantities.build quantity: luminous_intensity


# Acceleration
acceleration = Quantity.find_or_create_by! symbol: 'a', name: 'Acceleration', description: 'Change of the speed or velocity per unit time', vector: true
meter_per_square_second = UnitOfMeasurement.find_or_create_by! symbol: 'm s<sup>-2</sup>', name: 'meter per square second', base: true
meter_per_square_second.connected_quantities.build quantity: acceleration

# Angular acceleration
angular_acceleration = Quantity.find_or_create_by! symbol: 'a<sub>α</sub>', name: 'Angular acceleration', description: 'Change in angular speed or velocity per unit time'
rad_per_square_second = UnitOfMeasurement.find_or_create_by! symbol: 'rad s<sup>-2</sup>', name: 'rad per square second', base: true
rad_per_square_second.connected_quantities.build quantity: angular_acceleration

# Angular velocity
angular_velocity = Quantity.find_or_create_by! symbol: 'ω', name: 'Angular velocity', description: 'The angle incremented in a plane by a segment connecting an object and a reference point per unit time'
rad_per_second = UnitOfMeasurement.find_or_create_by! symbol: 'rad s<sup>-1</sup>', name: 'rad per second', base: true
rad_per_second.connected_quantities.build quantity: angular_velocity

# Area
area = Quantity.find_or_create_by! symbol: 'A', name: 'Area', description: 'Extent of a surface'
square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'm²', name: 'square meter', base: true
square_meter.connected_quantities.build quantity: area

# Area density
area_density = Quantity.find_or_create_by! symbol: 'ρ<sub>A</sub>', name: 'Area density', description: 'Mass per unit area'
kilogram_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'kg m<sup>-2</sup>', name: 'kilogram per square meter', base: true
kilogram_per_square_meter.connected_quantities.build quantity: area_density

# Capacitance
capacitance = Quantity.find_or_create_by! symbol: 'C', name: 'Capacitance', description: 'Stored charge per unit electric potential'
farad = UnitOfMeasurement.find_or_create_by! symbol: 'F', name: 'farad', base: true
farad.connected_quantities.build quantity: capacitance

# Chemical potential
chemical_potential = Quantity.find_or_create_by! symbol: 'μ<sub>ch</sub>', name: 'Chemical potential', description: 'Energy per unit change in amount of substance'
joule_per_mole = UnitOfMeasurement.find_or_create_by! symbol: 'J mol<sup>-1</sup>', name: 'joule per mole', base: true
joule_per_mole.connected_quantities.build quantity: chemical_potential

# Current density
current_density = Quantity.find_or_create_by! symbol: 'J', name: 'Current density', description: 'Electric current per unit cross-section area', vector: true
ampere_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'A m<sup>-2</sup>', name: 'ampere per square meter', base: true
ampere_per_square_meter.connected_quantities.build quantity: current_density

# Electric charge
electric_charge = Quantity.find_or_create_by! symbol: 'Q', name: 'Electric charge', description: 'The force per unit electric field strength'
coulomb = UnitOfMeasurement.find_or_create_by! symbol: 'C', name: 'coulomb', base: true
coulomb.connected_quantities.build quantity: electric_charge

# Electric charge density
electric_charge_density = Quantity.find_or_create_by! symbol: 'ρ<sub>Q</sub>', name: 'Electric charge density', description: 'Electric charge per unit volume'
coulomb_per_cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'C m<sup>-3</sup>', name: 'coulomb per cubic meter', base: true
coulomb_per_cubic_meter.connected_quantities.build quantity: electric_charge_density

# Electric displacement
electric_displacement = Quantity.find_or_create_by! symbol: 'D', name: 'Electric displacement', description: 'Strength of the electric displacement', vector: true
coulomb_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'C m<sup>-2</sup>', name: 'coulomb per square meter', base: true
coulomb_per_square_meter.connected_quantities.build quantity: electric_displacement

# Electric field strength
electric_field_strength = Quantity.find_or_create_by! symbol: 'E', name: 'Electric field strength', description: 'Strength of the electric field', vector: true
volt_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'V m<sup>-1</sup>', name: 'volt per meter', base: true
volt_per_meter.connected_quantities.build quantity: electric_field_strength

# Electrical conductance
electrical_conductance = Quantity.find_or_create_by! symbol: 'G', name: 'Electrical conductance', description: 'Measure for how easily current flows through a material'
siemens = UnitOfMeasurement.find_or_create_by! symbol: 'S', name: 'siemens', base: true
siemens.connected_quantities.build quantity: electrical_conductance

# Electrical conductivity
electrical_conductivity = Quantity.find_or_create_by! symbol: 'σ', name: 'Electrical conductivity', description: "Measure of a material's ability to conduct an electric current"
siemens_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'S m<sup>-1</sup>', name: 'siemens per meter', base: true
siemens_per_meter.connected_quantities.build quantity: electrical_conductivity

# Electric potential
electric_potential = Quantity.find_or_create_by! symbol: 'U', name: 'Electric potential', description: 'Energy required to move a unit charge through an electric field from a reference point'
volt = UnitOfMeasurement.find_or_create_by! symbol: 'V', name: 'volt', base: true
volt.connected_quantities.build quantity: electric_potential

# Electrical resistance
electrical_resistance = Quantity.find_or_create_by! symbol: 'R', name: 'Electrical resistance', description: 'Electric potential per unit electric current'
ohm = UnitOfMeasurement.find_or_create_by! symbol: 'Ω', name: 'ohm', base: true
ohm.connected_quantities.build quantity: electrical_resistance

# Electrical resistivity
electrical_resistivity = Quantity.find_or_create_by! symbol: 'ρ<sub>el</sub>', name: 'Electrical resistivity', description: 'Bulk property equivalent of electrical resistance'
ohm_meter = UnitOfMeasurement.find_or_create_by! symbol: 'Ω m', name: 'ohm meter', base: true
ohm_meter.connected_quantities.build quantity: electrical_resistivity

# Energy
energy = Quantity.find_or_create_by! symbol: 'E<sub>i</sub>', name: 'Energy', description: 'Capacity of a body or system to do work'
joule = UnitOfMeasurement.find_or_create_by! symbol: 'J', name: 'joule', base: true
joule.connected_quantities.build quantity: energy

# Energy density
energy_density = Quantity.find_or_create_by! symbol: 'ρ<sub>E</sub>', name: 'Energy density', description: 'Energy per unit volume'
joule_per_cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'J m<sup>-3</sup>', name: 'joule per cubic meter', base: true
joule_per_cubic_meter.connected_quantities.build quantity: energy_density

# Entropy
entropy = Quantity.find_or_create_by! symbol: 'S<sub>sys</sub>', name: 'Entropy', description: 'Logarithmic measure of the number of available states of a system'
joule_per_kelvin = UnitOfMeasurement.find_or_create_by! symbol: 'J K<sup>-1</sup>', name: 'joule per kelvin', base: true
joule_per_kelvin.connected_quantities.build quantity: entropy

# Force
force = Quantity.find_or_create_by! symbol: 'F', name: 'Force', description: 'Transfer of momentum per unit time', vector: true
newton = UnitOfMeasurement.find_or_create_by! symbol: 'N', name: 'newton', base: true
newton.connected_quantities.build quantity: force

# Frequency
frequency = Quantity.find_or_create_by! symbol: 'f', name: 'Frequency', description: 'Number of (periodic) occurrences per unit time'
hertz = UnitOfMeasurement.find_or_create_by! symbol: 'Hz', name: 'hertz', base: true
hertz.connected_quantities.build quantity: frequency

# Heat
heat = Quantity.find_or_create_by! symbol: 'Q<sub>th</sub>', name: 'Heat', description: 'Thermal energy'
joule = UnitOfMeasurement.find_or_create_by! symbol: 'J', name: 'joule', base: true
joule.connected_quantities.build quantity: heat

# Heat capacity
heat_capacity = Quantity.find_or_create_by! symbol: 'C<sub>p</sub>', name: 'Heat capacity', description: 'Energy per unit temperature change'
joule_per_kelvin = UnitOfMeasurement.find_or_create_by! symbol: 'J K<sup>-1</sup>', name: 'joule per kelvin', base: true
joule_per_kelvin.connected_quantities.build quantity: heat_capacity

# Heat flux density
heat_flux_density = Quantity.find_or_create_by! symbol: 'ϕ<sub>Q</sub>', name: 'Heat flux density', description: 'Heat flow per unit time per unit surface area'
watt_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'W m<sup>-2</sup>', name: 'watt per square meter', base: true
watt_per_square_meter.connected_quantities.build quantity: heat_flux_density

# Illuminance
illuminance = Quantity.find_or_create_by! symbol: 'E<sub>v</sub>', name: 'Illuminance', description: 'Luminous flux per unit surface area'
lux = UnitOfMeasurement.find_or_create_by! symbol: 'lx', name: 'lux', base: true
lux.connected_quantities.build quantity: illuminance

# Impedance
impedance = Quantity.find_or_create_by! symbol: 'Z', name: 'Impedance', description: 'Resistance to an alternating current of a given frequency, including effect on phase'
ohm = UnitOfMeasurement.find_or_create_by! symbol: 'Ω', name: 'ohm', base: true
ohm.connected_quantities.build quantity: impedance

# Impulse
impulse = Quantity.find_or_create_by! symbol: 'Δp', name: 'Impulse', description: 'Transferred momentum', vector: true
newton_second = UnitOfMeasurement.find_or_create_by! symbol: 'N s', name: 'newton second', base: true
newton_second.connected_quantities.build quantity: impulse

# Inductance
inductance = Quantity.find_or_create_by! symbol: 'L<sub>m</sub>', name: 'Inductance', description: 'Magnetic flux generated per unit current through a circuit'
henry = UnitOfMeasurement.find_or_create_by! symbol: 'H', name: 'henry', base: true
henry.connected_quantities.build quantity: inductance

# Intensity
intensity = Quantity.find_or_create_by! symbol: 'I<sub>P</sub>', name: 'Intensity', description: 'Power per unit cross sectional area'
watt_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'W m<sup>-2</sup>', name: 'watt per square meter', base: true
watt_per_square_meter.connected_quantities.build quantity: intensity

# Luminous flux
luminous_flux = Quantity.find_or_create_by! symbol: 'F<sub>ph</sub>', name: 'Luminous flux', description: 'Perceived power of a light source'
lumen = UnitOfMeasurement.find_or_create_by! symbol: 'lm', name: 'lumen', base: true
lumen.connected_quantities.build quantity: luminous_flux

# Magnetic field strength
magnetic_field_strength = Quantity.find_or_create_by! symbol: 'H', name: 'Magnetic field strength', description: 'Strength of a magnetic field', vector: true
ampere_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'A m<sup>-1</sup>', name: 'ampere per meter', base: true
ampere_per_meter.connected_quantities.build quantity: magnetic_field_strength

# Magnetic flux
magnetic_flux = Quantity.find_or_create_by! symbol: 'Φ', name: 'Magnetic flux', description: 'Measure of magnetism, taking account of the strength and the extent of a magnetic field'
weber = UnitOfMeasurement.find_or_create_by! symbol: 'Wb', name: 'weber', base: true
weber.connected_quantities.build quantity: magnetic_flux

# Magnetic flux density
magnetic_flux_density = Quantity.find_or_create_by! symbol: 'B', name: 'Magnetic flux density', description: 'Measure for the strength of the magnetic field'
tesla = UnitOfMeasurement.find_or_create_by! symbol: 'T', name: 'tesla', base: true
tesla.connected_quantities.build quantity: magnetic_flux_density

# Magnetization
magnetization = Quantity.find_or_create_by! symbol: 'M', name: 'Magnetization', description: 'Amount of magnetic moment per unit volume', vector: true
ampere_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'A m<sup>-1</sup>', name: 'ampere per meter', base: true
ampere_per_meter.connected_quantities.build quantity: magnetization

# Density
density = Quantity.find_or_create_by! symbol: 'ρ', name: 'Density', description: 'Mass per unit volume'
kilogram_per_cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'kg m<sup>-3</sup>', name: 'kilogram per cubic meter', base: true
kilogram_per_cubic_meter.connected_quantities.build quantity: density

# Molar concentration
molar_concentration = Quantity.find_or_create_by! symbol: 'C<sub>mol</sub>', name: 'Molar concentration', description: 'Amount of substance per unit volume'
mole_per_cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'mol m<sup>-3</sup>', name: 'mole per cubic meter', base: true
mole_per_cubic_meter.connected_quantities.build quantity: molar_concentration

# Molar heat capacity
molar_heat_capacity = Quantity.find_or_create_by! symbol: 'c<sub>mol</sub>', name: 'Molar heat capacity', description: 'Heat capacity of a material per unit amount of substance'
joule_per_kelvin_mole = UnitOfMeasurement.find_or_create_by! symbol: 'J K<sup>-1</sup> mol<sup>-1</sup>', name: 'joule per kelvin mole', base: true
joule_per_kelvin_mole.connected_quantities.build quantity: molar_heat_capacity

# Moment of inertia
moment_of_inertia = Quantity.find_or_create_by! symbol: 'I<sub>m</sub>', name: 'Moment of inertia', description: 'Inertia of an object with respect to angular acceleration'
kilogram_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'kg m<sup>-2</sup>', name: 'kilogram per square meter', base: true
kilogram_per_square_meter.connected_quantities.build quantity: moment_of_inertia

# Momentum
momentum = Quantity.find_or_create_by! symbol: 'p', name: 'Momentum', description: "Product of an object's mass and velocity", vector: true
newton_second = UnitOfMeasurement.find_or_create_by! symbol: 'N s', name: 'newton second', base: true
newton_second.connected_quantities.build quantity: momentum

# Permeability
permeability = Quantity.find_or_create_by! symbol: 'μ', name: 'Permeability', description: 'Measure for how the magnetization of material is affected by the application of an external magnetic field'
henry_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'H m<sup>-1</sup>', name: 'henry per meter', base: true
henry_per_meter.connected_quantities.build quantity: permeability

# Permittivity
permittivity = Quantity.find_or_create_by! symbol: 'ε', name: 'Permittivity', description: 'Measure for how the polarization of a material is affected by the application of an external electric field'
farad_per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'F m<sup>-1</sup>', name: 'farad per meter', base: true
farad_per_meter.connected_quantities.build quantity: permittivity

# Plain angle
plain_angle = Quantity.find_or_create_by! symbol: 'θ', name: 'Plain angle', description: 'Ratio of circular arc length to radius'
radian = UnitOfMeasurement.find_or_create_by! symbol: 'rad', name: 'radian', base: true
radian.connected_quantities.build quantity: plain_angle

# Power
power = Quantity.find_or_create_by! symbol: 'P', name: 'Power', description: 'Rate of transfer of energy per unit time'
watt = UnitOfMeasurement.find_or_create_by! symbol: 'W', name: 'watt', base: true
watt.connected_quantities.build quantity: power

# Pressure
pressure = Quantity.find_or_create_by! symbol: 'p<sub>f</sub>', name: 'Pressure', description: 'Force per unit area'
pascal = UnitOfMeasurement.find_or_create_by! symbol: 'Pa', name: 'pascal', base: true
pascal.connected_quantities.build quantity: pressure

# Reaction rate
reaction_rate = Quantity.find_or_create_by! symbol: 'r', name: 'Reaction rate', description: 'Rate of a chemical reaction for unit time'
mole_per_cubic_meter_second = UnitOfMeasurement.find_or_create_by! symbol: 'mol m<sup>-3</sup> s<sup>-1</sup>', name: 'molde per cubic meter second', base: true
mole_per_cubic_meter_second.connected_quantities.build quantity: reaction_rate

# Speed
speed = Quantity.find_or_create_by! symbol: 'v<sub>abs</sub>', name: 'Speed', description: 'Moved distance per unit time: the first time derivative of position'
meter_per_second = UnitOfMeasurement.find_or_create_by! symbol: 'm s<sup>-1</sup>', name: 'meter per second', base: true
meter_per_second.connected_quantities.build quantity: speed

# Spin
spin = Quantity.find_or_create_by! symbol: 'S', name: 'Spin', description: 'Quantum-mechanically defined angular momentum of a particle'
kilogram_square_meter_per_second = UnitOfMeasurement.find_or_create_by! symbol: 'kg m<sup>2</sup> s<sup>-1</sup>', name: 'kilogram square meter per second', base: true
kilogram_square_meter_per_second.connected_quantities.build quantity: spin

# Stress
stress = Quantity.find_or_create_by! symbol: 'p<sub>p</sub>', name: 'Stress', description: 'Force per unit oriented surface area'
pascal = UnitOfMeasurement.find_or_create_by! symbol: 'Pa', name: 'pascal', base: true
pascal.connected_quantities.build quantity: stress

# Surface tension
surface_tension = Quantity.find_or_create_by! symbol: 'γ', name: 'Surface tension', description: 'Energy change per unit change in surface area'
joule_per_square_meter = UnitOfMeasurement.find_or_create_by! symbol: 'J m<sup>-2</sup>', name: 'joule per square meter', base: true
joule_per_square_meter.connected_quantities.build quantity: surface_tension

# Thermal conductivity
thermal_conductivity = Quantity.find_or_create_by! symbol: 'k', name: 'Thermal conductivity', description: 'Measure for the ease with which a material conducts heat'
watt_per_meter_kelvin = UnitOfMeasurement.find_or_create_by! symbol: 'W m<sup>-1</sup> K<sup>-1</sup>', name: 'watt per meter kelvin', base: true
watt_per_meter_kelvin.connected_quantities.build quantity: thermal_conductivity

# Torque
torque = Quantity.find_or_create_by! symbol: 'τ', name: 'Torque', description: 'Product of a force and the perpendicular distance of the force from the point about which it is exerted'
newton_meter = UnitOfMeasurement.find_or_create_by! symbol: 'N m', name: 'newton meter', base: true
newton_meter.connected_quantities.build quantity: torque

# Velocity
velocity = Quantity.find_or_create_by! symbol: 'v', name: 'Velocity', description: 'Speed and direction of an object', vector: true
meter_per_second = UnitOfMeasurement.find_or_create_by! symbol: 'm s<sup>-1</sup>', name: 'meter per second', base: true
meter_per_second.connected_quantities.build quantity: velocity

# Volume
volume = Quantity.find_or_create_by! symbol: 'V', name: 'Volume', description: 'Three dimensional extent of an object'
cubic_meter = UnitOfMeasurement.find_or_create_by! symbol: 'm<sup>3</sup>', name: 'cubic meter', base: true
cubic_meter.connected_quantities.build quantity: volume

# Wavelength
wavelength = Quantity.find_or_create_by! symbol: 'λ', name: 'Wavelength', description: 'Perpendicular distance between repeating units of a wave'
meter = UnitOfMeasurement.find_or_create_by! symbol: 'm', name: 'meter', base: true
meter.connected_quantities.build quantity: wavelength

# Wavenumber
wavenumber = Quantity.find_or_create_by! symbol: 'k<sub>λ</sub>', name: 'Wavenumber', description: 'Repetency or spacial frequency: the number of cycles per unit distance'
per_meter = UnitOfMeasurement.find_or_create_by! symbol: 'm<sup>-1</sup>', name: 'per meter', base: true
per_meter.connected_quantities.build quantity: wavenumber

# Weight
weight = Quantity.find_or_create_by! symbol: 'w', name: 'Weight', description: 'Gravitational force on an object'
newton = UnitOfMeasurement.find_or_create_by! symbol: 'N', name: 'newton', base: true
newton.connected_quantities.build quantity: weight

# Work
work = Quantity.find_or_create_by! symbol: 'W', name: 'Work', description: 'Transferred energy'
joule = UnitOfMeasurement.find_or_create_by! symbol: 'J', name: 'joule', base: true
joule.connected_quantities.build quantity: work





# Constants

## Vacuum speed of light
vacuum_speed_of_light = Constant.find_or_create_by! symbol: 'c<sub>0</sub>', name: 'Vacuum speed of light', value: BigDecimal.new('2.99792458E8'), unit_of_measurement: meter_per_second
vacuum_speed_of_light.update_attributes name: 'Lichtegeschwindigkeit im Vakuum', locale: :de

## Newtonian constant of gravitation
cubic_meter_per_kilogram_square_second = UnitOfMeasurement.find_or_create_by! symbol: 'm<sup>3</sup> kg<sup>-1</sup> s<sup>-2</sup>', name: 'cubic meter per kilogram square second'
newtonian_constant_of_gravitation = Constant.find_or_create_by! symbol: 'G<sub>N</sub>', name: 'Newtonian constant of gravitation', value: BigDecimal.new('6.673E-11'), unit_of_measurement: cubic_meter_per_kilogram_square_second
newtonian_constant_of_gravitation.update_attributes name: 'Gravitationskonstante', locale: :de

## Planck constant
joule_second = UnitOfMeasurement.find_or_create_by! symbol: 'J s', name: 'joule second'
planck_constant = Constant.find_or_create_by! symbol: 'h', name: 'Planck constant', value: BigDecimal.new('6.626069E-34'), unit_of_measurement: joule_second
planck_constant.update_attributes name: 'Plancksches Wirkungsquantum', locale: :de





# Equations

Equation.find_or_create_by! quantity: force, equation: 'm * a'
Equation.find_or_create_by! quantity: mass, equation: 'F / a'
Equation.find_or_create_by! quantity: acceleration, equation: 'F / m'




# Translations

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
celcius.update_attributes name: 'Grad Celcius', locale: :de
fahrenheit.update_attributes name: 'Grad Fahrenheit', locale: :de

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
