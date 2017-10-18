# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# Demo
user = User.create email: 'demo@example.com', password: 'password'
user&.encrypted_password




# Length
length = Quantity.find_or_create_by! symbol: 'l', name: 'Length', description: 'The one-dimensional extent of an object'
length_meter = UnitOfMeasurement.find_or_create_by! quantity: length, symbol: 'm', name: 'meter', base: true
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
mass_kilogram = UnitOfMeasurement.find_or_create_by! quantity: mass, symbol: 'kg', name: 'kilogram', base: true
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
time_second = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 's', name: 'second', base: true
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

# Electric current
electric_current = Quantity.find_or_create_by! symbol: 'I', name: 'Electric current', description: 'Rate of flow of electrical charge per unit time'
electric_current_ampere = UnitOfMeasurement.find_or_create_by! quantity: electric_current, symbol: 'A', name: 'ampere', base: true
electric_current_miliampere = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'mA', name: 'miliampere', to_base: '/1000'
electric_current_microampere = UnitOfMeasurement.find_or_create_by! quantity: electric_current, symbol: 'µA', name: 'microampere', to_base: '/1000000'
electric_current_nanoampere = UnitOfMeasurement.find_or_create_by! quantity: electric_current, symbol: 'nA', name: 'nanoampere', to_base: '/1000000000'
electric_current_picoampere = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'pA', name: 'picoampere', to_base: '/1000000000000'
electric_current_femtoampere = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'fA', name: 'femtoampere', to_base: '/1000000000000000'
electric_current_attoampere = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'aA', name: 'attoampere', to_base: '/1000000000000000000'
electric_current_zeptoampere = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'zA', name: 'zeptoampere', to_base: '/1000000000000000000000'
electric_current_yoctoampere = UnitOfMeasurement.find_or_create_by! quantity: time, symbol: 'yA', name: 'yoctoampere', to_base: '/1000000000000000000000000'

# Temperature
temperature = Quantity.find_or_create_by! symbol: 'T', name: 'Temperature', description: 'Average kinetic energy per degree of freedom of a system'
temperature_kelvin = UnitOfMeasurement.find_or_create_by! quantity: temperature, symbol: 'K', name: 'kelvin', base: true
temperature_celcius = UnitOfMeasurement.find_or_create_by! quantity: temperature, symbol: '°C', name: 'celcius', to_base: '+273.15'
temperature_fahrenheit = UnitOfMeasurement.find_or_create_by! quantity: temperature, symbol: '°F', name: 'fahrenheit', to_base: '*(5/9)+459.67*(5/9)'

# Amount of substance
amount_of_substance = Quantity.find_or_create_by! symbol: 'n', name: 'Amount of substance', description: 'Number of particles compared to the number of atoms in 0.012 kg of 12C'
amount_of_substance_mole = UnitOfMeasurement.find_or_create_by! quantity: amount_of_substance, symbol: 'mol', name: 'mole', base: true

# Luminous intensity
luminous_intensity = Quantity.find_or_create_by! symbol: 'L', name: 'Luminous intensity', description: 'Wavelength-weighted power of emitted light per unit solid angle'
luminous_intensity_candela = UnitOfMeasurement.find_or_create_by! quantity: luminous_intensity, symbol: 'cd', name: 'candela', base: true


# Acceleration
acceleration = Quantity.find_or_create_by! symbol: 'a', name: 'Acceleration', description: 'Change of the speed or velocity per unit time', vector: true
acceleration_meter_per_square_second = UnitOfMeasurement.find_or_create_by! quantity: acceleration, symbol: 'm s<sup>-2</sup>', name: 'meter per square second', base: true

# Angular acceleration
angular_acceleration = Quantity.find_or_create_by! symbol: 'a<sub>α</sub>', name: 'Angular acceleration', description: 'Change in angular speed or velocity per unit time'
angular_acceleration_rad_per_square_second = UnitOfMeasurement.find_or_create_by! quantity: angular_acceleration, symbol: 'rad s<sup>-2</sup>', name: 'rad per square second', base: true

# Angular velocity
angular_velocity = Quantity.find_or_create_by! symbol: 'ω', name: 'Angular velocity', description: 'The angle incremented in a plane by a segment connecting an object and a reference point per unit time'
angular_velocity_rad_per_second = UnitOfMeasurement.find_or_create_by! quantity: angular_velocity, symbol: 'rad s<sup>-1</sup>', name: 'rad per second', base: true

# Area
area = Quantity.find_or_create_by! symbol: 'A', name: 'Area', description: 'Extent of a surface'
area_square_meter = UnitOfMeasurement.find_or_create_by! quantity: area, symbol: 'm²', name: 'square meter', base: true

# Area density
area_density = Quantity.find_or_create_by! symbol: 'ρ<sub>A</sub>', name: 'Area density', description: 'Mass per unit area'
area_density_kilogram_per_square_meter = UnitOfMeasurement.find_or_create_by! quantity: area_density, symbol: 'kg m<sup>-2</sup>', name: 'kilogram per square meter', base: true

# Capacitance
capacitance = Quantity.find_or_create_by! symbol: 'C', name: 'Capacitance', description: 'Stored charge per unit electric potential'
capacitance_farad = UnitOfMeasurement.find_or_create_by! quantity: capacitance, symbol: 'F', name: 'farad', base: true

# Chemical potential
chemical_potential = Quantity.find_or_create_by! symbol: 'μ<sub>ch</sub>', name: 'Chemical potential', description: 'Energy per unit change in amount of substance'
chemical_potential_joule_per_mole = UnitOfMeasurement.find_or_create_by! quantity: chemical_potential, symbol: 'J mol<sup>-1</sup>', name: 'joule per mole', base: true

# Current density
current_density = Quantity.find_or_create_by! symbol: 'J', name: 'Current density', description: 'Electric current per unit cross-section area', vector: true
current_density_ampere_per_square_meter = UnitOfMeasurement.find_or_create_by! quantity: current_density, symbol: 'A m<sup>-2</sup>', name: 'ampere per square meter', base: true

# Electric charge
electric_charge = Quantity.find_or_create_by! symbol: 'Q', name: 'Electric charge', description: 'The force per unit electric field strength'
electric_charge_coulomb = UnitOfMeasurement.find_or_create_by! quantity: electric_charge, symbol: 'C', name: 'coulomb', base: true

# Electric charge density
electric_charge_density = Quantity.find_or_create_by! symbol: 'ρ<sub>Q</sub>', name: 'Electric charge density', description: 'Electric charge per unit volume'
electric_charge_density_coulomb_per_cubic_meter = UnitOfMeasurement.find_or_create_by! quantity: electric_charge_density, symbol: 'C m<sup>-3</sup>', name: 'coulomb per cubic meter', base: true

# Electric displacement
electric_displacement = Quantity.find_or_create_by! symbol: 'D', name: 'Electric displacement', description: 'Strength of the electric displacement', vector: true
electric_displacement_coulomb_per_square_meter = UnitOfMeasurement.find_or_create_by! quantity: electric_displacement, symbol: 'C m<sup>-2</sup>', name: 'coulomb per square meter', base: true

# Electric field strength
electric_field_strength = Quantity.find_or_create_by! symbol: 'E', name: 'Electric field strength', description: 'Strength of the electric field', vector: true
electric_field_strength_volt_per_meter = UnitOfMeasurement.find_or_create_by! quantity: electric_field_strength, symbol: 'V m<sup>-1</sup>', name: 'volt per meter', base: true

# Electrical conductance
electrical_conductance = Quantity.find_or_create_by! symbol: 'G', name: 'Electrical conductance', description: 'Measure for how easily current flows through a material'
electrical_conductance_siemens = UnitOfMeasurement.find_or_create_by! quantity: electrical_conductance, symbol: 'S', name: 'siemens', base: true

# Electrical conductivity
electrical_conductivity = Quantity.find_or_create_by! symbol: 'σ', name: 'Electrical conductivity', description: "Measure of a material's ability to conduct an electric current"
electrical_conductivity_siemens_per_meter = UnitOfMeasurement.find_or_create_by! quantity: electrical_conductivity, symbol: 'S m<sup>-1</sup>', name: 'siemens per meter', base: true

# Electric potential
electric_potential = Quantity.find_or_create_by! symbol: 'U', name: 'Electric potential', description: 'Energy required to move a unit charge through an electric field from a reference point'
electric_potential_volt = UnitOfMeasurement.find_or_create_by! quantity: electric_potential, symbol: 'V', name: 'volt', base: true

# Electrical resistance
electrical_resistance = Quantity.find_or_create_by! symbol: 'R', name: 'Electrical resistance', description: 'Electric potential per unit electric current'
electrical_resistance_ohm = UnitOfMeasurement.find_or_create_by! quantity: electrical_resistance, symbol: 'Ω', name: 'ohm', base: true

# Electrical resistivity
electrical_resistivity = Quantity.find_or_create_by! symbol: 'ρ<sub>el</sub>', name: 'Electrical resistivity', description: 'Bulk property equivalent of electrical resistance'
electrical_resistivity_ohm_meter = UnitOfMeasurement.find_or_create_by! quantity: electrical_resistivity, symbol: 'Ω m', name: 'ohm meter', base: true

# Energy
energy = Quantity.find_or_create_by! symbol: 'E<sub>i</sub>', name: 'Energy', description: 'Capacity of a body or system to do work'
energy_joule = UnitOfMeasurement.find_or_create_by! quantity: energy, symbol: 'J', name: 'joule', base: true

# Energy density
energy_density = Quantity.find_or_create_by! symbol: 'ρ<sub>E</sub>', name: 'Energy density', description: 'Energy per unit volume'
energy_density_joule_per_cubic_meter = UnitOfMeasurement.find_or_create_by! quantity: energy_density, symbol: 'J m<sup>-3</sup>', name: 'joule per cubic meter', base: true

# Entropy
entropy = Quantity.find_or_create_by! symbol: 'S<sub>sys</sub>', name: 'Entropy', description: 'Logarithmic measure of the number of available states of a system'
entropy_joule_per_kelvin = UnitOfMeasurement.find_or_create_by! quantity: entropy, symbol: 'J K<sup>-1</sup>', name: 'joule per kelvin', base: true

# Force
force = Quantity.find_or_create_by! symbol: 'F', name: 'Force', description: 'Transfer of momentum per unit time', vector: true
force_newton = UnitOfMeasurement.find_or_create_by! quantity: force, symbol: 'N', name: 'newton', base: true

# Frequency
frequency = Quantity.find_or_create_by! symbol: 'f', name: 'Frequency', description: 'Number of (periodic) occurrences per unit time'
frequency_hertz = UnitOfMeasurement.find_or_create_by! quantity: frequency, symbol: 'Hz', name: 'hertz', base: true

# Heat
heat = Quantity.find_or_create_by! symbol: 'Q<sub>th</sub>', name: 'Heat', description: 'Thermal energy'
heat_joule = UnitOfMeasurement.find_or_create_by! quantity: heat, symbol: 'J', name: 'joule', base: true

# Heat capacity
heat_capacity = Quantity.find_or_create_by! symbol: 'C<sub>p</sub>', name: 'Heat capacity', description: 'Energy per unit temperature change'
heat_capacity_joule_per_kelvin = UnitOfMeasurement.find_or_create_by! quantity: heat_capacity, symbol: 'J K<sup>-1</sup>', name: 'joule per kelvin', base: true

# Heat flux density
heat_flux_density = Quantity.find_or_create_by! symbol: 'ϕ<sub>Q</sub>', name: 'Heat flux density', description: 'Heat flow per unit time per unit surface area' ##### Q should be an index #####
heat_flux_density_watt_per_square_meter = UnitOfMeasurement.find_or_create_by! quantity: heat_flux_density, symbol: 'W m<sup>-2</sup>', name: 'watt per square meter', base: true

# Illuminance
illuminance = Quantity.find_or_create_by! symbol: 'E<sub>v</sub>', name: 'Illuminance', description: 'Luminous flux per unit surface area'
illuminance_lux = UnitOfMeasurement.find_or_create_by! quantity: illuminance, symbol: 'lx', name: 'lux', base: true

# Impedance
impedance = Quantity.find_or_create_by! symbol: 'Z', name: 'Impedance', description: 'Resistance to an alternating current of a given frequency, including effect on phase'
impedance_ohm = UnitOfMeasurement.find_or_create_by! quantity: impedance, symbol: 'Ω', name: 'ohm', base: true

# Impulse
impulse = Quantity.find_or_create_by! symbol: 'Δp', name: 'Impulse', description: 'Transferred momentum', vector: true
impulse_newton_second = UnitOfMeasurement.find_or_create_by! quantity: impulse, symbol: 'N s', name: 'newton second', base: true

# Inductance
inductance = Quantity.find_or_create_by! symbol: 'L<sub>m</sub>', name: 'Inductance', description: 'Magnetic flux generated per unit current through a circuit'
inductance_henry = UnitOfMeasurement.find_or_create_by! quantity: inductance, symbol: 'H', name: 'henry', base: true

# Intensity
intensity = Quantity.find_or_create_by! symbol: 'I<sub>P</sub>', name: 'Intensity', description: 'Power per unit cross sectional area'
intensity_watt_per_square_meter = UnitOfMeasurement.find_or_create_by! quantity: intensity, symbol: 'W m<sup>-2</sup>', name: 'watt per square meter', base: true

# Luminous flux
luminous_flux = Quantity.find_or_create_by! symbol: 'F<sub>ph</sub>', name: 'Luminous flux', description: 'Perceived power of a light source'
luminous_flux_lumen = UnitOfMeasurement.find_or_create_by! quantity: luminous_flux, symbol: 'lm', name: 'lumen', base: true

# Magnetic field strength
magnetic_field_strength = Quantity.find_or_create_by! symbol: 'H', name: 'Magnetic field strength', description: 'Strength of a magnetic field', vector: true
magnetic_field_strength_ampere_per_meter = UnitOfMeasurement.find_or_create_by! quantity: magnetic_field_strength, symbol: 'A m<sup>-1</sup>', name: 'ampere per meter', base: true

# Magnetic flux
magnetic_flux = Quantity.find_or_create_by! symbol: 'Φ', name: 'Magnetic flux', description: 'Measure of magnetism, taking account of the strength and the extent of a magnetic field'
magnetic_flux_weber = UnitOfMeasurement.find_or_create_by! quantity: magnetic_flux, symbol: 'Wb', name: 'weber', base: true

# Magnetic flux density
magnetic_flux_density = Quantity.find_or_create_by! symbol: 'B', name: 'Magnetic flux density', description: 'Measure for the strength of the magnetic field'
magnetic_flux_density_tesla = UnitOfMeasurement.find_or_create_by! quantity: magnetic_flux_density, symbol: 'T', name: 'tesla', base: true

# Magnetization
magnetization = Quantity.find_or_create_by! symbol: 'M', name: 'Magnetization', description: 'Amount of magnetic moment per unit volume', vector: true
magnetization_ampere_per_meter = UnitOfMeasurement.find_or_create_by! quantity: magnetization, symbol: 'A m<sup>-1</sup>', name: 'ampere per meter', base: true

# Density
density = Quantity.find_or_create_by! symbol: 'ρ', name: 'Density', description: 'Mass per unit volume'
density_kilogram_per_cubic_meter = UnitOfMeasurement.find_or_create_by! quantity: density, symbol: 'kg m<sup>-3</sup>', name: 'kilogram per cubic meter', base: true

# Molar concentration
molar_concentration = Quantity.find_or_create_by! symbol: 'C<sub>mol</sub>', name: 'Molar concentration', description: 'Amount of substance per unit volume'
molar_concentration_mole_per_cubic_meter = UnitOfMeasurement.find_or_create_by! quantity: molar_concentration, symbol: 'mol m<sup>-3</sup>', name: 'mole per cubic meter', base: true

# Molar heat capacity
molar_heat_capacity = Quantity.find_or_create_by! symbol: 'c<sub>mol</sub>', name: 'Molar heat capacity', description: 'Heat capacity of a material per unit amount of substance'
molar_heat_capacity_joule_per_kelvin_mole = UnitOfMeasurement.find_or_create_by! quantity: molar_heat_capacity, symbol: 'J K<sup>-1</sup> mol<sup>-1</sup>', name: 'joule per kelvin mole', base: true

# Moment of inertia
moment_of_inertia = Quantity.find_or_create_by! symbol: 'I<sub>m</sub>', name: 'Moment of inertia', description: 'Inertia of an object with respect to angular acceleration'
moment_of_inertia_kilogram_per_square_meter = UnitOfMeasurement.find_or_create_by! quantity: moment_of_inertia, symbol: 'kg m<sup>-2</sup>', name: 'kilogram per square meter', base: true

# Momentum
momentum = Quantity.find_or_create_by! symbol: 'p', name: 'Momentum', description: "Product of an object's mass and velocity", vector: true
momentum_newton_second = UnitOfMeasurement.find_or_create_by! quantity: momentum, symbol: 'N s', name: 'newton second', base: true

# Permeability
permeability = Quantity.find_or_create_by! symbol: 'μ', name: 'Permeability', description: 'Measure for how the magnetization of material is affected by the application of an external magnetic field'
permeability_henry_per_meter = UnitOfMeasurement.find_or_create_by! quantity: permeability, symbol: 'H m<sup>-1</sup>', name: 'henry per meter', base: true

# Permittivity
permittivity = Quantity.find_or_create_by! symbol: 'ε', name: 'Permittivity', description: 'Measure for how the polarization of a material is affected by the application of an external electric field'
permittivity_farad_per_meter = UnitOfMeasurement.find_or_create_by! quantity: permittivity, symbol: 'F m<sup>-1</sup>', name: 'farad per meter', base: true

# Plain angle
plain_angle = Quantity.find_or_create_by! symbol: 'θ', name: 'Plain angle', description: 'Ratio of circular arc length to radius'
plain_angle_radian = UnitOfMeasurement.find_or_create_by! quantity: plain_angle, symbol: 'rad', name: 'radian', base: true

# Power
power = Quantity.find_or_create_by! symbol: 'P', name: 'Power', description: 'Rate of transfer of energy per unit time'
power_watt = UnitOfMeasurement.find_or_create_by! quantity: power, symbol: 'W', name: 'watt', base: true

# Pressure
pressure = Quantity.find_or_create_by! symbol: 'p<sub>f</sub>', name: 'Pressure', description: 'Force per unit area'
pressure_pascal = UnitOfMeasurement.find_or_create_by! quantity: pressure, symbol: 'Pa', name: 'pascal', base: true

# Reaction rate
reaction_rate = Quantity.find_or_create_by! symbol: 'r', name: 'Reaction rate', description: 'Rate of a chemical reaction for unit time'
reaction_rate_mole_per_cubic_meter_second = UnitOfMeasurement.find_or_create_by! quantity: reaction_rate, symbol: 'mol m<sup>-3</sup> s<sup>-1</sup>', name: 'molde per cubic meter second', base: true

# Speed
speed = Quantity.find_or_create_by! symbol: 'v<sub>abs</sub>', name: 'Speed', description: 'Moved distance per unit time: the first time derivative of position'
speed_meter_per_second = UnitOfMeasurement.find_or_create_by! quantity: speed, symbol: 'm s<sup>-1</sup>', name: 'meter per second', base: true

# Spin
spin = Quantity.find_or_create_by! symbol: 'S', name: 'Spin', description: 'Quantum-mechanically defined angular momentum of a particle'
spin_kilogram_square_meter_per_second = UnitOfMeasurement.find_or_create_by! quantity: spin, symbol: 'kg m<sup>2</sup> s<sup>-1</sup>', name: 'kilogram square meter per second', base: true

# Stress
stress = Quantity.find_or_create_by! symbol: 'p<sub>p</sub>', name: 'Stress', description: 'Force per unit oriented surface area'
stress_pascal = UnitOfMeasurement.find_or_create_by! quantity: stress, symbol: 'Pa', name: 'pascal', base: true

# Surface tension
surface_tension = Quantity.find_or_create_by! symbol: 'γ', name: 'Surface tension', description: 'Energy change per unit change in surface area'
surface_tension_joule_per_square_meter = UnitOfMeasurement.find_or_create_by! quantity: surface_tension, symbol: 'J m<sup>-2</sup>', name: 'joule per square meter', base: true

# Thermal conductivity
thermal_conductivity = Quantity.find_or_create_by! symbol: 'k', name: 'Thermal conductivity', description: 'Measure for the ease with which a material conducts heat'
thermal_conductivity_watt_per_meter_kelvin = UnitOfMeasurement.find_or_create_by! quantity: thermal_conductivity, symbol: 'W m<sup>-1</sup> K<sup>-1</sup>', name: 'watt per meter kelvin', base: true

# Torque
torque = Quantity.find_or_create_by! symbol: 'τ', name: 'Torque', description: 'Product of a force and the perpendicular distance of the force from the point about which it is exerted'
torque_newton_meter = UnitOfMeasurement.find_or_create_by! quantity: torque, symbol: 'N m', name: 'newton meter', base: true

# Velocity
velocity = Quantity.find_or_create_by! symbol: 'v', name: 'Velocity', description: 'Speed and direction of an object', vector: true
velocity_meter_per_second = UnitOfMeasurement.find_or_create_by! quantity: velocity, symbol: 'm s<sup>-1</sup>', name: 'meter per second', base: true

# Volume
volume = Quantity.find_or_create_by! symbol: 'V', name: 'Volume', description: 'Three dimensional extent of an object'
volume_cubic_meter = UnitOfMeasurement.find_or_create_by! quantity: volume, symbol: 'm<sup>3</sup>', name: 'cubic meter', base: true

# Wavelength
wavelength = Quantity.find_or_create_by! symbol: 'λ', name: 'Wavelength', description: 'Perpendicular distance between repeating units of a wave'
wavelength_meter = UnitOfMeasurement.find_or_create_by! quantity: wavelength, symbol: 'm', name: 'meter', base: true

# Wavenumber
wavenumber = Quantity.find_or_create_by! symbol: 'k<sub>λ</sub>', name: 'Wavenumber', description: 'Repetency or spacial frequency: the number of cycles per unit distance'
wavenumber_per_meter = UnitOfMeasurement.find_or_create_by! quantity: wavenumber, symbol: 'm<sup>-1</sup>', name: 'per meter', base: true

# Weight
weight = Quantity.find_or_create_by! symbol: 'w', name: 'Weight', description: 'Gravitational force on an object'
weight_newton = UnitOfMeasurement.find_or_create_by! quantity: weight, symbol: 'N', name: 'newton', base: true

# Work
work = Quantity.find_or_create_by! symbol: 'W', name: 'Work', description: 'Transferred energy'
work_joule = UnitOfMeasurement.find_or_create_by! quantity: work, symbol: 'J', name: 'joule', base: true





# Equations

Equation.find_or_create_by! quantity: force, equation: 'm * a'
# Equation.find_or_create_by! quantity: mass, equation: 'F / a'
# Equation.find_or_create_by! quantity: acceleration, equation: 'F / m'




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

## Electric current
electric_current.update_attributes name: 'Stromstärke', description: 'Durchflussrate der elektrischen Ladung pro Zeiteinheit', locale: :de
electric_current_ampere.update_attributes name: 'Ampere', locale: :de
electric_current_miliampere.update_attributes name: 'Miliampere', locale: :de
electric_current_microampere.update_attributes name: 'Mikroampere', locale: :de
electric_current_nanoampere.update_attributes name: 'Nanoampere', locale: :de
electric_current_picoampere.update_attributes name: 'Pikoampere', locale: :de
electric_current_femtoampere.update_attributes name: 'Femtoampere', locale: :de
electric_current_attoampere.update_attributes name: 'Attoampere', locale: :de
electric_current_zeptoampere.update_attributes name: 'Zeptoampere', locale: :de
electric_current_yoctoampere.update_attributes name: 'Yoktoampere', locale: :de

## Temperature
temperature.update_attributes name: 'Temperatur', description: 'Durchschnittliche kinetische Energie pro Freiheitsgrad eines Systems', locale: :de
temperature_kelvin.update_attributes name: 'Kelvin', locale: :de
temperature_celcius.update_attributes name: 'Celcius', locale: :de
temperature_fahrenheit.update_attributes name: 'Fahrenheit', locale: :de

## Amount of substance
amount_of_substance.update_attributes name: 'Stoffmenge', description: 'Anzahl der Partikel im Vergleich zur Anzahl der Atome in 0,012 kg 12C', locale: :de
amount_of_substance_mole.update_attributes name: 'Mol', locale: :de

## Luminous intensity
luminous_intensity.update_attributes name: 'Lichtstärke', description: 'Wellenlängengewichtete Leistung des emittierten Lichts pro Raumwinkeleinheit', locale: :de
luminous_intensity_candela.update_attributes name: 'Candela', locale: :de


## Acceleration
acceleration.update_attributes name: 'Beschleunigung', description: 'Änderung der Geschwindigkeit pro Zeiteinheit', locale: :de
acceleration_meter_per_square_second.update_attributes name: 'Meter pro Quadratsekunde', locale: :de

## Angular acceleration
angular_acceleration.update_attributes name: 'Winkelbeschleunigung', description: 'Änderung der Winkelgeschwindigkeit pro Zeiteinheit', locale: :de
angular_acceleration_rad_per_square_second.update_attributes name: 'Rad pro Quadratsekunde', locale: :de

## Angular velocity
angular_velocity.update_attributes name: 'Winkelgeschwindigkeit', description: 'Der Winkel, der in einer Ebene durch ein Segment erhöht wird, das ein Objekt und einen Referenzpunkt pro Zeiteinheit verbindet', locale: :de
angular_velocity_rad_per_second.update_attributes name: 'Rad pro Sekunde', locale: :de

## Area
area.update_attributes name: 'Fläche', description: 'Ausmaß einer Oberfläche', locale: :de
area_square_meter.update_attributes name: 'Quadratmeter', locale: :de

## Area density
area_density.update_attributes name: 'Massenbelegung', description: 'Masse pro Flächeneinheit', locale: :de
area_density_kilogram_per_square_meter.update_attributes name: 'Kilogramm pro Quadratmeter', locale: :de

## Capacitance
capacitance.update_attributes name: 'Kapazität', description: 'Gespeicherte Ladung pro elektrischem Potential', locale: :de
capacitance_farad.update_attributes name: 'Farad', locale: :de

## Chemical potential
chemical_potential.update_attributes name: 'Chemisches Potential', description: 'Energie pro Einheitsänderung der Stoffmenge', locale: :de
chemical_potential_joule_per_mole.update_attributes name: 'Joule pro Mol', locale: :de

## Current density
current_density.update_attributes name: 'Elektrische Stromdichte', description: 'Elektrischer Strom pro Querschnittsfläche', locale: :de
current_density_ampere_per_square_meter.update_attributes name: 'Ampere pro Quadratmeter', locale: :de

## Electric charge
electric_charge.update_attributes name: 'Elektrische Ladung', description: 'Die Kraft pro Einheit der elektrischen Feldstärke', locale: :de
electric_charge_coulomb.update_attributes name: 'Coulomb', locale: :de

## Electric charge density
electric_charge_density.update_attributes name: 'Elektrische Ladungsdichte', description: 'Die Kraft pro Einheit der elektrischen Feldstärke', locale: :de
electric_charge_density_coulomb_per_cubic_meter.update_attributes name: 'Coulomb pro Kubikmeter', locale: :de

## Electric displacement
electric_displacement.update_attributes name: 'Dielektrische Verschiebung', description: 'Stärke der elektrischen Verschiebung', locale: :de
electric_displacement_coulomb_per_square_meter.update_attributes name: 'Coulomb pro Quadratmeter', locale: :de

## Electric field strength
electric_field_strength.update_attributes name: 'Elektrische Feldstärke', description: 'Stärke des elektrischen Feldes', locale: :de
electric_field_strength_volt_per_meter.update_attributes name: 'Volt pro Meter', locale: :de

## Electrical conductance
electrical_conductance.update_attributes name: 'Elektrischer Materialwiderstand', description: 'Maß der Leichtigkeit, mit der Strom durch ein Material fließt', locale: :de
electrical_conductance_siemens.update_attributes name: 'Siemens', locale: :de

## Electrical conductivity
electrical_conductivity.update_attributes name: 'Elektrische Leitfähigkeit', description: 'Maß der Fähigkeit eines Materials, elektrischen Strom zu leiten', locale: :de
electrical_conductivity_siemens_per_meter.update_attributes name: 'Siemens pro Meter', locale: :de

## Electric potential
electric_potential.update_attributes name: 'Elektrische Spannung', description: 'Energie, die benötigt wird, um eine Einheitsladung von einem Referenzpunkt durch ein elektrisches Feld zu bewegen', locale: :de
electric_potential_volt.update_attributes name: 'Volt', locale: :de

## Electrical resistance
electrical_resistance.update_attributes name: 'Elektrischer Widerstand', description: 'Elektrisches Potential pro elektrischem Strom', locale: :de
electrical_resistance_ohm.update_attributes name: 'Ohm', locale: :de

## Electrical resistivity
electrical_resistivity.update_attributes name: 'Elektrischer Mengenwiderstand', description: 'Mengeneigenschaftsäquivalent des elektrischen Widerstandes', locale: :de
electrical_resistivity_ohm_meter.update_attributes name: 'Ohmmeter', locale: :de

## Energy
energy.update_attributes name: 'Energie', description: 'Arbeitskapazität eines Körpers oder Systems', locale: :de
energy_joule.update_attributes name: 'Joule', locale: :de

## Energy density
energy_density.update_attributes name: 'Energiedichte', description: 'Energie pro Volumeneinheit', locale: :de
energy_density_joule_per_cubic_meter.update_attributes name: 'Joule pro Kubikmeter', locale: :de

## Entropy
entropy.update_attributes name: 'Entropie', description: 'Logarithmisches Maß für die Anzahl der verfügbaren Zustände eines Systems', locale: :de
entropy_joule_per_kelvin.update_attributes name: 'Joule pro Kelvin', locale: :de

## Force
force.update_attributes name: 'Kraft', description: 'Übertragung eines Impulses pro Zeiteinheit', locale: :de
force_newton.update_attributes name: 'Newton', locale: :de

## Frequency
frequency.update_attributes name: 'Frequenz', description: 'Anzahl von (periodischen) Ereignissen pro Zeiteinheit', locale: :de
frequency_hertz.update_attributes name: 'Hertz', locale: :de

## Heat
heat.update_attributes name: 'Wärmemenge', description: 'Wärmeenergie', locale: :de
heat_joule.update_attributes name: 'Joule', locale: :de

## Heat capacity
heat_capacity.update_attributes name: 'Wärmekapazität', description: 'Energie pro Temperaturänderung', locale: :de
heat_capacity_joule_per_kelvin.update_attributes name: 'Joule pro Kelvin', locale: :de

## Heat flux density
heat_flux_density.update_attributes name: 'Wärmestromdichte', description: 'Wärmefluss pro Zeiteinheit und Flächeneinheit', locale: :de
heat_flux_density_watt_per_square_meter.update_attributes name: 'Watt pro Quadratmeter', locale: :de

## Illuminance
illuminance.update_attributes name: 'Beleuchtungsstärke', description: 'Lichtstrom pro Flächeneinheit', locale: :de
illuminance_lux.update_attributes name: 'Lux', locale: :de

## Impedance
impedance.update_attributes name: 'Impedanz', description: 'Widerstand gegen einen Wechselstrom einer bestimmten Frequenz, einschließlich der Auswirkung auf die Phase', locale: :de
impedance_ohm.update_attributes name: 'Ohm', locale: :de

## Impulse
impulse.update_attributes name: 'Impuls', description: 'Übertragene Dynamik', locale: :de
impulse_newton_second.update_attributes name: 'Newtonsekunde', locale: :de

## Inductance
inductance.update_attributes name: 'Induktivität', description: 'Magnetischer Fluss, der pro Einheitsstrom durch eine Schaltung erzeugt wird', locale: :de
inductance_henry.update_attributes name: 'Henry', locale: :de

## Intensity
intensity.update_attributes name: 'Intensität', description: 'Leistung pro Querschnittseinheit', locale: :de
intensity_watt_per_square_meter.update_attributes name: 'Watt pro Quadratmeter', locale: :de

## Luminous flux
luminous_flux.update_attributes name: 'Lichtstrom', description: 'Wahrgenommene Kraft einer Lichtquelle', locale: :de
luminous_flux_lumen.update_attributes name: 'Lumen', locale: :de

## Magnetic field strength
magnetic_field_strength.update_attributes name: 'Magnetische Feldstärke', description: 'Stärke eines Magnetfeldes', locale: :de
magnetic_field_strength_ampere_per_meter.update_attributes name: 'Ampere pro Meter', locale: :de

## Magnetic flux
magnetic_flux.update_attributes name: 'Magnetischer Fluss', description: 'Maß des Magnetismus unter Berücksichtigung der Stärke und des Ausmaßes eines Magnetfeldes', locale: :de
magnetic_flux_weber.update_attributes name: 'Weber', locale: :de

## Magnetic flux density
magnetic_flux_density.update_attributes name: 'Magnetische Flussdichte', description: 'Maß für die Stärke des Magnetfeldes', locale: :de
magnetic_flux_density_tesla.update_attributes name: 'Tesla', locale: :de

## Magnetization
magnetization.update_attributes name: 'Magnetisierung', description: 'Menge des magnetischen Momentes pro Volumeneinheit', locale: :de
magnetization_ampere_per_meter.update_attributes name: 'Ampere pro Meter', locale: :de

## Density
density.update_attributes name: 'Dichte', description: 'Masse pro Volumeneinheit', locale: :de
density_kilogram_per_cubic_meter.update_attributes name: 'Kilogramm pro Kubikmeter', locale: :de

## Molar concentration
molar_concentration.update_attributes name: 'Stoffmengenkonzentration', description: 'Menge einer Substanz pro Volumeneinheit', locale: :de
molar_concentration_mole_per_cubic_meter.update_attributes name: 'Mol pro Kubikmeter', locale: :de

## Molar heat capacity
molar_heat_capacity.update_attributes name: 'Wärmekapazität', description: 'Wärmekapazität eines Materials pro Stoffmenge einer Substanz', locale: :de
molar_heat_capacity_joule_per_kelvin_mole.update_attributes name: 'Joule pro Kelvinmol', locale: :de

## Moment of inertia
moment_of_inertia.update_attributes name: 'Trägheitsmoment', description: 'Trägheit eines Objekts in Bezug auf die Winkelbeschleunigung', locale: :de
moment_of_inertia_kilogram_per_square_meter.update_attributes name: 'Kilogramm pro Quadratmeter', locale: :de

## Momentum
momentum.update_attributes name: 'Momentum', description: 'Produkt der Masse und Geschwindigkeit eines Objekts', locale: :de
momentum_newton_second.update_attributes name: 'Newtonsekunde', locale: :de

## Permeability
permeability.update_attributes name: 'Magnetische Permeabilität', description: 'Maß für den Einfluss eines externen Magnetfeldes auf die Magnetisierung eines Materials', locale: :de
permeability_henry_per_meter.update_attributes name: 'Henry pro Meter', locale: :de

## Permittivity
permittivity.update_attributes name: 'Permittivität', description: 'Maß für den Einfluss eines externen Magnetfeldes auf die Polarisation eines Materials', locale: :de
permittivity_farad_per_meter.update_attributes name: 'Farad pro Meter', locale: :de

## Plain angle
plain_angle.update_attributes name: 'Winkel', description: 'Verhältnis von Kreisbogenlänge zu Radius', locale: :de
plain_angle_radian.update_attributes name: 'Radiant', locale: :de

## Power
power.update_attributes name: 'Leistung', description: 'Übertragungsrate von Energie pro Zeiteinheit', locale: :de
power_watt.update_attributes name: 'Watt', locale: :de

## Pressure
pressure.update_attributes name: 'Druck', description: 'Kraft pro Flächeneinheit', locale: :de
pressure_pascal.update_attributes name: 'Pascal', locale: :de

## Reaction rate
reaction_rate.update_attributes name: 'Reaktionsgeschwindigkeit', description: 'Geschwindigkeit einer chemischen Reaktion', locale: :de
reaction_rate_mole_per_cubic_meter_second.update_attributes name: 'Mol pro Kubikmetersekunde', locale: :de

## Speed
speed.update_attributes name: 'Geschwindigkeitsbetrag', description: 'Zurückgelegte Distanz pro Zeiteinheit. Die erste Ableitung der Position.', locale: :de
speed_meter_per_second.update_attributes name: 'Meter pro Sekunde', locale: :de

## Spin
spin.update_attributes name: 'Drehimpuls', description: 'Quantenmechanisch definierter Drehimpuls eines Teilchens', locale: :de
spin_kilogram_square_meter_per_second.update_attributes name: 'Kilogramm-Quadratmeter pro Sekunde', locale: :de

## Stress
stress.update_attributes name: 'Mechanische Spannung', description: 'Kraft pro Einheitsorientierter Oberfläche', locale: :de
stress_pascal.update_attributes name: 'Pascal', locale: :de

## Surface tension
surface_tension.update_attributes name: 'Oberflächenspannung', description: 'Energieänderung pro Flächeneinheit', locale: :de
surface_tension_joule_per_square_meter.update_attributes name: 'Joule pro Quadratmeter', locale: :de

## Thermal conductivity
thermal_conductivity.update_attributes name: 'Wärmeleitfähigkeit', description: 'Maß für die Leichtigkeit, mit der ein Material Wärme leitet', locale: :de
thermal_conductivity_watt_per_meter_kelvin.update_attributes name: 'Watt pro Meterkelvin', locale: :de

## Torque
torque.update_attributes name: 'Drehmoment', description: 'Produkt einer Kraft und der senkrechte Abstand der Kraft von dem Punkt, um den sich das Objekt dreht', locale: :de
torque_newton_meter.update_attributes name: 'Newtonmeter', locale: :de

## Velocity
velocity.update_attributes name: 'Geschwindigkeit', description: 'Geschwindigkeit und Richtung eines Objekts', locale: :de
velocity_meter_per_second.update_attributes name: 'Meter pro Sekunde', locale: :de

## Volume
volume.update_attributes name: 'Volumen', description: 'Dreidimensionale Ausdehnung eines Objekts', locale: :de
volume_cubic_meter.update_attributes name: 'Kubikmeter', locale: :de

## Wavelength
wavelength.update_attributes name: 'Wellenlänge', description: 'Senkrechter Abstand zwischen sich wiederholenden Einheiten einer Welle', locale: :de
wavelength_meter.update_attributes name: 'Meter', locale: :de

## Wavenumber
wavenumber.update_attributes name: 'Wellenzahl', description: 'Repetitions- oder räumliche Frequenz. Die Anzahl der Zyklen pro Entfernungseinheit.', locale: :de
wavenumber_per_meter.update_attributes name: 'Pro Meter', locale: :de

## Weight
weight.update_attributes name: 'Gewichtskraft', description: 'Gravitationskraft auf ein Objekt', locale: :de
weight_newton.update_attributes name: 'Newton', locale: :de

## Work
work.update_attributes name: 'Arbeit', description: 'Übertragene Energie', locale: :de
work_joule.update_attributes name: 'Joule', locale: :de
