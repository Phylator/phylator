class UnitOfMeasurement < ApplicationRecord

    translates :name

    validates :symbol, presence: true, uniqueness: true
    validates :name, uniqueness: true
    validates :exchange_rate, presence: true
    validates :base, uniqueness: { scope: :quantity_id }

    belongs_to :quantity
    has_many :measurements, class_name: 'Calculation::Measurement'

end
