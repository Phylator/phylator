class Calculation::Result < ApplicationRecord

    self.table_name = 'calculation_results'

    before_validation :calc

    include Value
    # include MarginOfError

    belongs_to :calculation, class_name: '::Calculation'

    private

    def calc

        # Init calculator
        calculator = Dentaku::Calculator.new case_sensitive: true

        # Init variables & convert to base
        ## Group measurements by quantity
        measurements_per_quantity = self.calculation.measurements.group_by &:quantity_id
        ## Initialize arrays
        decimal_places = []
        # decimal_places_errors = []
        # symbols = []
        measurements_per_quantity.each do |quantity_id, measurements|
            ## Get symbol for quantity
            symbol = ::Quantity.find(quantity_id).pure_sym
            # symbols << symbol
            measurements.each_with_index do |measurement, index|
                measurement = measurements.first
                var = measurement.value
                # margin_of_error = measurement.margin_of_error
                ## Convert measurement to base unit
                unless measurement.unit_of_measurement.base?
                    var = calculator.evaluate var.to_s + measurement.unit_of_measurement.to_base
                    # margin_of_error = calculator.evaluate( margin_of_error.to_s + measurement.unit_of_measurement.to_base )
                end
                ## Store variable in calculator
                if index > 0
                    calculator.store "#{symbol}#{index}": var.to_f
                else
                    calculator.store "#{symbol}": var.to_f
                end
                # calculator.store "#{symbol}_error": margin_of_error
            end
        end

        # Add constants
        (::Constant&.purchased(self.calculation.user) + ::Constant.free).each do |constant|
            symbol = constant.pure_sym
            var = constant.value
            calculator.store "#{symbol}": var
        end
        ## Return specific message, if necessary constant has not been added yet!

        # Solve equations
        ## Solve equations unless unit conversion is requested
        unless measurements_per_quantity.has_key?(self.calculation.quantity_id)
            ## Add equations
            equations = {}
            ::Quantity.all.each do |quantity|
                equations[quantity.pure_sym] = []
            end
            ::Equation.all.each do |equation| ##### LEADING TO: TSort exception #####
            # ::Equation.where(quantity_id: self.calculation.quantity_id).each do |equation|
                equations[equation.quantity.pure_sym] << equation.pure_equation
                ## Associate equation with calculation if used
                if calculator.dependencies(equation.pure_equation).size == 0
                    self.calculation.add_belongable! equation
                    ## Associate physical constant with calculation if used
                    ::Constant.all.each do |constant|
                        symbol = constant.pure_sym
                        if equation.pure_equation.include? symbol
                            self.calculation.add_belongable! constant
                        end
                    end
                end
            end
            ## UNNECESSARY
            equations.each do |key, value|
                equations.delete(key) if value == []
            end
            ## Solve equations
            begin
                calculation_results = calculator.solve equations
                calculation_result = calculation_results[self.calculation.quantity.pure_sym]&.map {|x| BigDecimal(x) rescue nil }&.compact&.first || :undefined
            rescue TSort::Cyclic
                calculation_result = :undefined
            end

            # calculation_result = :undefined
            # ::Equation.where(quantity_id: self.calculation.quantity_id).each do |equation|
            #     if calculator.dependencies(equation.equation).size == 0
            #         ## Associate equation with calculation if used
            #         self.calculation.calculation_equations.create! equation: equation
            #         ## Associate physical constant with calculation if used
            #         ::Constant.all.each do |constant|
            #             symbol = constant.pure_sym
            #             if equation.equation.include? symbol
            #                 self.calculation.calculation_constants.create! constant: constant
            #             end
            #         end
            #         calculation_result = calculator.evaluate equation.equation
            #         break
            #     end
            # end

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
        else
            calculation_result = calculator.evaluate self.calculation.quantity.pure_sym
        end

        unless calculation_result == :undefined
            # Convert result to requested unit
            symbol = self.calculation.quantity.pure_sym
            precision = decimal_places.min
            ## Convert to requested unit
            if self.calculation.unit_of_measurement.base?
                result = calculation_result
            else
                result = calculator.evaluate calculation_result.to_s + self.calculation.unit_of_measurement.from_base
                # resulting_error = calculator.evaluate( "round(#{symbol}_error, #{decimal_places_errors.min})" + self.calculation.unit_of_measurement.from_base )
            end


            # Store result
            self.value = result
            # self.margin_of_error = resulting_error
        else
            # Storing needed dependencies
            if equations
                i = 0
                equations[self.calculation.quantity.pure_sym].each do |equation|
                    dependencies = calculator.dependencies equation
                    dependencies.uniq.each do |dependency|
                        quantities = []
                        Quantity.all.each do |quantity|
                            quantities << quantity if quantity.pure_sym == dependency
                        end
                        self.calculation.add_belongable! quantities.first, index: i
                    end
                    i += 1
                end
            end

            self.undefined = true
        end

    end

end
