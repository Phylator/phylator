class Calculation::Result < ApplicationRecord

    self.table_name = 'calculation_results'

    before_validation :calc

    include Value

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
        measurements_per_quantity.each do |quantity_id, measurements|
            ## Get symbol for quantity
            symbol = Quantity.find(quantity_id).pure_sym
            measurements.each_with_index do |measurement, index|
                var = measurement.value
                ## Convert measurement to base unit
                unless measurement.unit_of_measurement.base?
                    var = calculator.evaluate var.to_s + measurement.unit_of_measurement.to_base
                end
                ## Store variable in calculator
                if index > 0
                    calculator.store "#{symbol}_#{index}": var.to_f
                else
                    calculator.store "#{symbol}": var.to_f
                end
            end
        end

        # Add constants
        constants = self.calculation.user ? Constant.free + self.calculation.user.constants : Constant.free
        constants.each do |constant|
            symbol = constant.pure_sym
            var = constant.value
            calculator.store "#{symbol}": var
        end
        ##### Return specific message, if necessary constant has not been added yet! #####

        # Solve equations
        ## Solve equations unless unit conversion is requested
        unless measurements_per_quantity.has_key?(self.calculation.quantity_id)
            ## Add equations
            equations = {}
            usable_quantities = self.calculation.user ? Quantity.free + self.calculation.user.quantities : Quantity.free
            usable_quantities.each do |quantity|
                equations[quantity.pure_sym] = []
            end
            usable_equations = self.calculation.user ? Equation.free + self.calculation.user.equations : Equation.free
            # usable_equations.each do |equation| ##### LEADING TO: TSort exception #####
            Equation.where(quantity: self.calculation.quantity).each do |equation|
                equations[equation.quantity.pure_sym] << equation.pure_equation
                ## Associate equation with calculation if used
                if calculator.dependencies(equation.pure_equation).size == 0
                    self.calculation.add_belongable!(equation, scope: :dependency) unless self.calculation.equations.include?(equation)
                    ## Associate physical constant with calculation if used
                    Constant.all.each do |constant|
                        symbol = constant.pure_sym
                        if equation.pure_equation.include? symbol
                            self.calculation.add_belongable!(constant) unless self.calculation.constants.include?(constant)
                        end
                    end
                end
            end
            ## UNNECESSARY
            equations.each do |key, value|
                equations.delete(key) if value.nil? || value == []
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

            ## Store result to calculator
            calculator.store "#{self.calculation.quantity.pure_sym}": calculation_result if calculation_result.present?
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
            end


            # Store result
            self.value = result
        else
            # Storing needed dependencies
            if equations
                equations[self.calculation.quantity.pure_sym].each do |equation|
                    self.calculation.add_belongable!(equation, scope: :missing) unless self.calculation.missing_equations.include?(equation)
                end
            end

            self.undefined = true
        end

    end

end
