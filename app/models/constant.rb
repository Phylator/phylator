class Constant < ApplicationRecord

    before_save :evaluate_value

    extend FriendlyId
    include AlgoliaSearch
    include Value
    include Uniqueness
    friendly_id :name, use: :slugged
    translates :name, :description
    acts_as_belongable

    algoliasearch do
        attribute :name
        add_attribute :algolia_sym
    end
    def algolia_sym
        self.symbol.sub('<sub>', '').sub('</sub>', '').force_encoding('UTF-8')
    end

    cattr_accessor :set_value

    validates :symbol, presence: true
    validates :name, presence: true
    validates :unit_of_measurement, presence: true

    belongs_to :pack
    belongs_to :unit_of_measurement
    belongable :calculations, 'Calculation'
    belongable :equations, 'Equation'

    scope :purchased, lambda { |user| includes(pack: :purchases).where(packs: { purchases: { user_id: user&.id } }) }
    scope :free, -> { includes(:pack).where(packs: { price: 0 }) }

    def sym
        self.symbol.html_safe
    end
    def pure_sym
        self.symbol.sub('<sub>', '_').sub('</sub>', '').force_encoding('UTF-8')
    end

    private

    def evaluate_value
        calculator = Dentaku::Calculator.new
        self.value = calculator.evaluate self.set_value
    end

end
