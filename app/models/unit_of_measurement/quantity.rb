class UnitOfMeasurement::Quantity < ApplicationRecord

    self.table_name = 'unit_of_measurement_quantities'

    belongs_to :quantity, class_name: '::Quantity'
    belongs_to :unit_of_measurement, class_name: '::UnitOfMeasurement'

end
