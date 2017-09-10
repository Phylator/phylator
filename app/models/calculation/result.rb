class Calculation::Result < ApplicationRecord

    self.table_name = 'calculation_results'

    before_validation :calc

    include Value
    include MarginOfError
    include Decimals

    validates :value, presence: true

    belongs_to :calculation, class_name: '::Calculation'

    private

    def calc

        # Init calculator
        calculator = Dentaku::Calculator.new

        # Init variables & convert to base
        measurements_per_quantity = self.calculation.measurements.group_by &:quantity_id
        decimal_places = []
        symbols = []
        measurements_per_quantity.each do |quantity_id, measurements|
            measurement = measurements.first
            symbol = ::Quantity.find(quantity_id).symbol
            symbols << symbol
            if measurement.unit_of_measurement.base?
                var = measurement.value
                margin_of_error = measurement.margin_of_error || 0
            else
                var = calculator.evaluate( measurement.value.to_s + measurement.unit_of_measurement.to_base )
                margin_of_error = calculator.evaluate( measurement.margin_of_error.to_s + measurement.unit_of_measurement.to_base )
            end
            decimal_places << decimals(var)
            decimal_places << decimals(margin_of_error)
            calculator.store "#{symbol}": var
            calculator.store "#{symbol}_error": margin_of_error
        end

        if measurements_per_quantity.has_key?(self.calculation.quantity_id) && measurements_per_quantity.count == 1

            # Convert
            symbol = self.calculation.quantity.symbol
            if self.calculation.unit_of_measurement.base?
                result = calculator.evaluate(symbol)
                resulting_error = calculator.evaluate("#{symbol}_error")
            else
                result = calculator.evaluate( symbol.to_s + self.calculation.unit_of_measurement.from_base )
                resulting_error = calculator.evaluate( "#{symbol}_error" + self.calculation.unit_of_measurement.from_base )
            end

        else

            # Solve equations
            equations = {}
            ::Equation.all.each do |equation|
                equations[equation.quantity.symbol] = equation.equation
            end
            results = calculator.solve equations
            result = results[self.calculation.quantity.symbol]

        end


        if result == :undefined
            self.undefined = true
        else
            # Round result to lowest decimal places of measurements
            result = result.round decimal_places.min

            self.value = result
            self.margin_of_error = resulting_error
        end

    end

end
