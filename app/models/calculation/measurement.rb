class Calculation::Measurement < ApplicationRecord

    self.table_name = 'calculation_measurements'

    before_save :re_calc, on: :update

    include Value

    validates :value, presence: true

    belongs_to :calculation, class_name: '::Calculation'
    belongs_to :unit_of_measurement, class_name: '::UnitOfMeasurement'
    belongs_to :quantity, class_name: '::Quantity'

    private

    def re_calc
        self.calculation.calc if self.value_changed? || self.margin_of_error_changed?
    end

end
