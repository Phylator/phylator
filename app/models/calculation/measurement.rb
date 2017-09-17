class Calculation::Measurement < ApplicationRecord

    self.table_name = 'calculation_measurements'

    before_create :defaults

    include Value
    include MarginOfError

    validates :value, presence: true

    belongs_to :calculation, class_name: '::Calculation'
    belongs_to :unit_of_measurement, class_name: '::UnitOfMeasurement'
    belongs_to :quantity, class_name: '::Quantity'

    private

    def defaults
        self.margin_of_error = BigDecimal.new(0) unless self.margin_of_error.present?
    end

end
