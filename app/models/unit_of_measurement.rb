class UnitOfMeasurement < ApplicationRecord

    translates :name

    validates :symbol, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    validates :to_base, presence: true

    has_many :quantities, through: :connected_quantities
    has_many :connected_quantities, class_name: 'UnitOfMeasurement::Quantity', source: :quantity
    has_many :measurements, class_name: 'Calculation::Measurement'

    def sym
        self.symbol.html_safe
    end

    def base?
        self.base
    end

    def from_base
        self.from_base || self.to_base.tr('*/', '/*')
    end

end
