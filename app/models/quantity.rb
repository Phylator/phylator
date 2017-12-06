class Quantity < ApplicationRecord

    # acts_as_taggable
    extend FriendlyId
    friendly_id :name, use: :slugged
    translates :name, :description

    include Uniqueness
    validates :symbol, presence: true
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    has_many :quantity_unit_of_measurements, class_name: 'UnitOfMeasurement::Quantity', source: :unit_of_measurement, dependent: :destroy
    has_many :unit_of_measurements, through: :quantity_unit_of_measurements
    has_many :equations
    has_many :measurements, class_name: 'Calculation::Measurement'
    has_many :equation_quantities, class_name: '::Equation::Quantity'
    has_many :in_equations, through: :equation_quantities, source: :equation

    belongs_to :pack

    belongs_to :parent_quantity, class_name: 'Quantity', foreign_key: 'parent_quantity_id', required: false
    has_many :child_quantities, class_name: 'Quantity', foreign_key: 'parent_quantity_id'

    def sym
        self.symbol.html_safe
    end
    def pure_sym
        self.symbol.sub('<sub>', '_').sub('</sub>', '').force_encoding('UTF-8')
    end
    def ascii_sym
        self.symbol.sub('<sub>', '_"').sub('</sub>', '"').force_encoding('UTF-8')
    end

    scope :base, -> { where(parent_quantity: nil) }
    scope :purchased, lambda { |user| includes(pack: :purchases).where(packs: { purchases: { user_id: user.id } }) }
    scope :free, -> { includes(:pack).where(packs: { price: 0 }) }

end
