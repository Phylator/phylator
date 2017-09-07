class Calculation < ApplicationRecord

    after_create_commit :calculate

    acts_as_taggable

    validates :measurements, presence: true

    has_one :result, class_name: 'Calculation::Result'
    has_many :measurements, class_name: 'Calculation::Measurement'

    belongs_to :unit_of_measurement, class_name: '::UnitOfMeasurement'
    belongs_to :quantity, class_name: '::Quantity'
    belongs_to :user, optional: true

    private

    def calculate
        self.build_result
    end

end
