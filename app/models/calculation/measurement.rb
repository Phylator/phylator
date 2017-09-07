class Calculation::Measurement < ApplicationRecord

    self.table_name = 'calculation_measurements'

    validates :value, presence: true, numericality: true

    belongs_to :calculation, class_name: '::Calculation'
    belongs_to :unit_of_measurement, class_name: '::UnitOfMeasurement'
    belongs_to :quantity, class_name: '::Quantity'

end
