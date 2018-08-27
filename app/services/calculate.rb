# frozen_string_literal: true

class Calculate
  def initialize(calculation:)
    @calculator = Dentaku::Calculator.new(case_sensitive: true)
    @calculation = calculation
  end

  def perform
    store_measurements
    store_constants
    result = calculate_result

    if result
      Convert.new(result, to: @calculation.unit_of_measurement).perform
    else
      add_missing_dependencies
      nil
    end
  end

  private

  def store_measurements
    measurements_per_quantity =
      @calculation.measurements&.group_by(&:quantity_id)

    measurements_per_quantity&.each do |quantity_id, measurements|
      quantity_sym = Quantity.find(quantity_id).pure_sym

      measurements.each_with_index do |measurement, index|
        store_measurement(measurement, quantity_sym, index)
      end
    end
  end

  def store_measurement(measurement, quantity_sym, index)
    variable = index.positive? ? "#{quantity_sym}_#{index}" : quantity_sym.to_s
    value = Convert.new(measurement.value,
                        from: measurement.unit_of_measurement).perform.to_f

    @calculator.store("#{variable}": value)
  end

  def store_constants
    AvailableConstants.new(user: @calculation.user).perform&.each do |constant|
      symbol = constant.pure_sym
      value = constant.value
      @calculator.store("#{symbol}": value)
    end
  end

  def calculate_result
    if @calculation.measurements.where(quantity: @calculation.quantity).any?
      @calculator.evaluate(@calculation.quantity.pure_sym)
    else
      add_equations
      add_constants
      solve
    end
  end

  def equations
    @equations ||=
      AvailableEquations.new(user: @calculation.user).perform
                        &.group_by { |equation| equation.quantity.pure_sym }
                        &.transform_values(&:pure_equation)
  end

  def add_equations
    equations.values.flatten.map do |equation|
      next unless @calculator.dependencies(equation.pure_equation).empty?
      next if @calculation.equations.include?(equation)

      @calculation.add_belongable!(equation, scope: :dependency)
    end
  end

  def add_constants
    AvailableConstants.new(user: @calculation.user).perform&.map do |constant|
      next if @calculator.equations&.map do |equation|
        equation.pure_equation.include?(constant.pure_sym) ? equation : nil
      end&.compact&.empty?
      next if @calculation.constants.include?(constant)

      @calculation.add_belongable!(constant, scope: :dependency)
    end
  end

  def add_missing_dependencies
    equations[@calculation.quantity.pure_sym]&.each do |equation|
      equation = Equation.find_by(equation: equation)
      next if @calculation.missing_equations.include?(equation)

      @calculation.add_belongable!(equation, scope: :missing)
    end
  end

  def solve
    @calculator.solve(equations)[@calculation.quantity.pure_sym]
               &.map do |result|
      parse_result(result)
    end&.compact&.first
  rescue TSort::Cyclic
    nil
  end

  def parse_result(result)
    BigDecimal(result)
  rescue TypeError
    nil
  end
end
