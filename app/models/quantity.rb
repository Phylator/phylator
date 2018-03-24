class Quantity < ApplicationRecord

    extend FriendlyId
    include AlgoliaSearch
    include Uniqueness
    friendly_id :name, use: :slugged
    translates :name, :description, :wikipedia
    acts_as_belonger
    acts_as_belongable

    algoliasearch do
        attribute :name, :description
        add_attribute :algolia_sym
    end
    def algolia_sym
        self.symbol.sub('<sub>', '').sub('</sub>', '').force_encoding('UTF-8')
    end

    validates :symbol, presence: true
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    has_many :equations
    has_many :measurements, class_name: 'Calculation::Measurement'
    belonger :unit_of_measurements, 'UnitOfMeasurement'

    belongs_to :pack
    belongable :in_equations, 'Equation'
    belongable :needed_by_calculations, 'Calculation'

    belongs_to :parent_quantity, class_name: 'Quantity', foreign_key: 'parent_quantity_id', required: false
    has_many :child_quantities, class_name: 'Quantity', foreign_key: 'parent_quantity_id'

    scope :base, -> { where(parent_quantity: nil) }
    scope :free, -> { includes(:pack).where(packs: { price: 0 }) }

    def sym
        self.symbol.html_safe
    end
    def pure_sym
        self.symbol.sub('<sub>', '_"').sub('</sub>', '"').force_encoding('UTF-8')
    end
    def ascii_sym
        self.symbol.sub('<sub>', '_"').sub('</sub>', '"').force_encoding('UTF-8')
    end

end
