class Calculation::Result < ApplicationRecord

    self.table_name = 'calculation_results'

    before_validation :calc

    include Value
    include MarginOfError
    include Decimals
    extend ActionView::Helpers::NumberHelper

    validates :value, presence: true

    belongs_to :calculation, class_name: '::Calculation'

    def trim num
        i, f = num.to_i, num.to_f
        i == f ? i : f
    end

    def delimiter num
        num.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end

    def pretty_value
        if self.value.to_s.size > 12
            "%e" % trim(self.value).to_s
        else
            delimiter(trim(self.value))
        end
    end

    def pretty_margin_of_error
        if self.margin_of_error.to_s.size > 12
            "%e" % trim(self.margin_of_error).to_s
        else
            delimiter(trim(self.margin_of_error))
        end
    end

    def value_decimals
        decimals self.value
    end

    def margin_of_error_decimals
        decimals self.margin_of_error
    end

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
            symbol = ::Quantity.find(quantity_id).symbol
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
                equations[equation.quantity.symbol] = equation.equation
            end
            calculation_results = calculator.solve equations
            calculation_result = calculation_results[self.calculation.quantity.symbol]

            ## Resulting errors
            error_equations = {}
            ::Equation.all.each do |equation|
                error_equations["#{equation.quantity.symbol}_error"] = equation.equation # append '_error' to each variable in equation
            end
            calculation_errors = calculator.solve equations
            calculation_error = calculation_errors["#{self.calculation.quantity.symbol}_error"]

            calculator.store "#{self.calculation.quantity.symbol}": calculation_result if calculation_result.present?
            calculator.store "#{self.calculation.quantity.symbol}_error": calculation_error if calculation_error.present?
        end

        # Convert
        symbol = self.calculation.quantity.symbol
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
