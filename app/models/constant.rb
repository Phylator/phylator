class Constant < ApplicationRecord

    before_save :evaluate_value

    include Value

    # acts_as_taggable
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged
    translates :name, :description

    include Uniqueness
    validates :symbol, presence: true
    validates :name, presence: true
    validates :value, presence: true
    validates :unit_of_measurement, presence: true

    has_many :calculation_constants, class_name: '::Calculation::Constant'
    has_many :calculations, through: :calculation_constants

    # has_many :belongs_to_equations, through: :equation_quantities, source: :equation
    # has_many :equation_quantities, class_name: 'Equation::Quantity', dependent: :destroy

    belongs_to :unit_of_measurement

    def sym
        self.symbol.html_safe
    end
    def pure_sym
        self.symbol.sub('<sub>', '').sub('</sub>', '')
    end

    private

    def slug_candidates
        [:pure_sym, :name]
    end

    def evaluate_value
        if self.value_changed?
            calculator = Dentaku::Calculator.new
            self.value = calculator.evaluate self.value
        end
    end

end
