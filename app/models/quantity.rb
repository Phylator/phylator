class Quantity < ApplicationRecord

    extend FriendlyId
    friendly_id :name, use: :slugged
    translates :name, :description, :wikipedia
    include AlgoliaSearch
    algoliasearch do
        attribute :name, :description
        add_attribute :algolia_sym
    end
    def algolia_sym
        self.symbol.sub('<sub>', '').sub('</sub>', '').force_encoding('UTF-8')
    end

    include Uniqueness
    validates :symbol, presence: true
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    has_many :quantity_unit_of_measurements, class_name: 'UnitOfMeasurement::Quantity', source: :unit_of_measurement, dependent: :destroy
    has_many :unit_of_measurements, through: :quantity_unit_of_measurements
    has_many :equations
    has_many :measurements, class_name: 'Calculation::Measurement'
    has_many :equation_quantities, class_name: '::Equation::Quantity', dependent: :destroy
    has_many :in_equations, through: :equation_quantities, source: :equation
    has_many :calculation_dependencies, class_name: '::Calculation::Dependency', dependent: :destroy
    has_many :needed_by_calculations, through: :calculation_dependencies, source: :calculation

    belongs_to :pack

    belongs_to :parent_quantity, class_name: 'Quantity', foreign_key: 'parent_quantity_id', required: false
    has_many :child_quantities, class_name: 'Quantity', foreign_key: 'parent_quantity_id'

    def sym
        self.symbol.html_safe
    end
    def pure_sym
        self.symbol.sub('<sub>', '_"').sub('</sub>', '"').force_encoding('UTF-8')
    end
    def ascii_sym
        self.symbol.sub('<sub>', '_"').sub('</sub>', '"').force_encoding('UTF-8')
    end

    scope :base, -> { where(parent_quantity: nil) }
    scope :purchased, lambda { |user| includes(pack: :purchases).where(packs: { purchases: { user_id: user&.id } }) }
    scope :free, -> { includes(:pack).where(packs: { price: 0 }) }

end
