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
        ## Group measurements by quantity
        measurements_per_quantity = self.calculation.measurements.group_by &:quantity_id
        ## Initialize arrays
        decimal_places = []
        # decimal_places_errors = []
        # symbols = []
        measurements_per_quantity.each do |quantity_id, measurements|
            ## Pick first measurement for quantity
            measurement = measurements.first
            var = measurement.value
            # margin_of_error = measurement.margin_of_error
            ## Get symbol for quantity
            symbol = ::Quantity.find(quantity_id).pure_sym
            # symbols << symbol
            ## Store decimal places of measurement
            decimal_places << decimals(var)
            # decimal_places_errors << decimals(margin_of_error)
            ## Convert measurement to base unit
            unless measurement.unit_of_measurement.base?
                var = calculator.evaluate var.to_s + measurement.unit_of_measurement.to_base
                # margin_of_error = calculator.evaluate( margin_of_error.to_s + measurement.unit_of_measurement.to_base )
            end
            ## Store variable in calculator
            calculator.store "#{symbol}": var.to_f
            # calculator.store "#{symbol}_error": margin_of_error
        end

        # Add constants
        Constant.all.each do |constant|
            symbol = constant.pure_sym
            var = constant.value
            calculator.store "#{symbol}": var
        end

        # Solve equations
        ## Solve equations unless unit conversion is requested
        unless measurements_per_quantity.has_key?(self.calculation.quantity_id) && measurements_per_quantity.count == 1
            ## Add equations
            equations = {}
            ::Equation.all.each do |equation|
                equations[equation.quantity.pure_sym] = equation.equation
                ## Associate equation with calculation if used
                # self.calculation.equations.create!(equation: equation) if calculator.dependencies(equation.equation).size == 0
            end
            ## Solve equations
            calculation_results = calculator.solve equations
            calculation_result = calculation_results[self.calculation.quantity.pure_sym]

            # ## Resulting errors
            # error_equations = {}
            # ::Equation.all.each do |equation|
            #     error_equations["#{equation.quantity.sym}_error"] = equation.equation # append '_error' to each variable in equation
            # end
            # calculation_errors = calculator.solve error_equations
            # calculation_error = calculation_errors["#{self.calculation.quantity.sym}_error"]

            ## Store result to calculator
            calculator.store "#{self.calculation.quantity.pure_sym}": calculation_result if calculation_result.present?
            # calculator.store "#{self.calculation.quantity.sym}_error": calculation_error if calculation_error.present?
        end

        unless calculation_result == :undefined
            # Convert result to requested unit
            symbol = self.calculation.quantity.pure_sym
            precision = decimal_places.min
            if self.calculation.unit_of_measurement.base?
                ## Base unit requested: Round result
                result = calculator.evaluate "round(#{symbol}, #{precision})"
                # resulting_error = calculator.evaluate("round(#{symbol}_error, #{decimal_places_errors.min})")
            else
                ## Other unit requested: Round result & convert
                result = calculator.evaluate "round(#{symbol}, #{precision})" + self.calculation.unit_of_measurement.from_base
                # resulting_error = calculator.evaluate( "round(#{symbol}_error, #{decimal_places_errors.min})" + self.calculation.unit_of_measurement.from_base )
            end


            # Store result
            self.value = result
            # self.margin_of_error = resulting_error
        else
            self.undefined = true
        end

    end

end
