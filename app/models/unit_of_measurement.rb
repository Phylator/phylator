class UnitOfMeasurement < ApplicationRecord

    translates :name

    validates :symbol, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    validates :to_base, presence: true

    belongs_to :quantity
    has_many :measurements, class_name: 'Calculation::Measurement'

    def base?
        self.to_base == '*1'
    end

    def from_base
        self.to_base.tr('*/', '/*')
    end

end
