class Calculation::Result < ApplicationRecord

    self.table_name = 'calculation_results'

    before_create :calc

    has_many :equations, through: :belonging_equations
    has_many :belonging_equations, class_name: 'Equation', dependent: :destroy

    belongs_to :calculation, class_name: '::Calculation'

    private

    def calc

        # Init calculator
        calculator = Dentaku::Calculator.new

        # Init variables & convert to base
        measurements_per_quantity = self.calculation.measurements.group_by(&:quantity_id)
        measurements_per_quantity.each do |quantity_id, measurements|
            instance_variable_set '@' + ::Quantity.find(quantity_id).symbol, ( measurements.first.unit_of_measurement.base? ? measurements.first.value : calculator.evaluate( measurements.first.value.to_s + measurements.first.unit_of_measurement.to_base ) )
        end

        # Convert
        if measurements_per_quantity.has_key?(self.calculation.quantity_id) && measurements_per_quantity.count == 1
            base = instance_variable_get('@' + self.calculation.quantity.symbol)
            result = ( self.calculation.unit_of_measurement.base? ? base : calculator.evaluate( base.to_s + self.calculation.unit_of_measurement.from_base ) )
        end

        self.value = result

    end

end
