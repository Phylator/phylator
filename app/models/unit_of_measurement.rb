class UnitOfMeasurement < ApplicationRecord

    extend FriendlyId
    friendly_id :name, use: :slugged
    translates :name
    acts_as_belonger
    acts_as_belongable

    validates :symbol, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    validates :to_base, presence: true

    has_many :calculations
    has_many :constants
    has_many :measurements, class_name: 'Calculation::Measurement'
    belongable :quantities, 'Quantity'

    belongs_to :si, class_name: 'UnitOfMeasurement', optional: true
    has_many :si_prefixes, class_name: 'UnitOfMeasurement', foreign_key: :si

    def sym
        self.symbol.html_safe
    end
    def base?
        self.base
    end
    def from_base
        self.f_base || self.to_base.tr('*/', '/*')
    end

end
