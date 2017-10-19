class Calculation::Result < ApplicationRecord

    self.table_name = 'calculation_results'

    before_validation :calc

    include Value
    include MarginOfError
    include Decimals
    extend ActionView::Helpers::NumberHelper

    validates :value, presence: true

    belongs_to :calculation, class_name: '::Calculation'

    private

    def calc

        # Init calculator
        calculator = Dentaku::Calculator.new

        # Init variables & convert to base
        measurements_per_quantity = self.calculation.measurements.group_by &:quantity_id
        decimal_places = []
        decimal_places_errors = []
        symbols = []
        measurements_per_quantity.each do |quantity_id, measurements|
            measurement = measurements.first
            symbol = ::Quantity.find(quantity_id).pure_sym
            symbols << symbol
            if measurement.unit_of_measurement.base?
                var = measurement.value
                margin_of_error = measurement.margin_of_error
            else
                var = calculator.evaluate( measurement.value.to_s + measurement.unit_of_measurement.to_base )
                margin_of_error = calculator.evaluate( measurement.margin_of_error.to_s + measurement.unit_of_measurement.to_base )
            end
            decimal_places << decimals(var)
            decimal_places_errors << decimals(margin_of_error)
            calculator.store "#{symbol}": var
            calculator.store "#{symbol}_error": margin_of_error
        end

        # Solve equations
        unless measurements_per_quantity.has_key?(self.calculation.quantity_id) && measurements_per_quantity.count == 1
            ## Results
            equations = {}
            ::Equation.all.each do |equation|
                equations[equation.quantity.pure_sym] = equation.equation
                self.calculation.equations.create!(equation: equation) if calculator.dependencies(equation.equation).size == 0
            end
            calculation_results = calculator.solve equations
            calculation_result = calculation_results[self.calculation.quantity.sym]

            ## Resulting errors
            error_equations = {}
            ::Equation.all.each do |equation|
                error_equations["#{equation.quantity.sym}_error"] = equation.equation # append '_error' to each variable in equation
            end
            calculation_errors = calculator.solve error_equations
            calculation_error = calculation_errors["#{self.calculation.quantity.sym}_error"]

            calculator.store "#{self.calculation.quantity.sym}": calculation_result if calculation_result.present?
            calculator.store "#{self.calculation.quantity.sym}_error": calculation_error if calculation_error.present?
        end

        # Convert
        symbol = self.calculation.quantity.sym
        base = self.calculation.unit_of_measurement.base?
        if base
            result = calculator.evaluate("round(#{symbol}, #{decimal_places.min})")
            resulting_error = calculator.evaluate("round(#{symbol}_error, #{decimal_places_errors.min})")
        else
            result = calculator.evaluate( "round(#{symbol}, #{decimal_places.min})" + self.calculation.unit_of_measurement.from_base )
            resulting_error = calculator.evaluate( "round(#{symbol}_error, #{decimal_places_errors.min})" + self.calculation.unit_of_measurement.from_base )
        end


        if result == :undefined
            self.undefined = true
        else
            self.value = result
            self.margin_of_error = resulting_error
        end

    end

end
