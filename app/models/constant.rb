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
    # validates :value, presence: true
    validates :unit_of_measurement, presence: true

    has_many :calculation_constants, class_name: '::Calculation::Constant'
    has_many :calculations, through: :calculation_constants

    # has_many :belongs_to_equations, through: :equation_quantities, source: :equation
    # has_many :equation_quantities, class_name: 'Equation::Quantity', dependent: :destroy

    belongs_to :unit_of_measurement

    cattr_accessor :set_value

    def sym
        self.symbol.html_safe
    end
    def pure_sym
        self.symbol.sub('<sub>', '_').sub('</sub>', '').force_encoding('UTF-8')
    end

    private

    def slug_candidates
        [:name]
    end

    def evaluate_value
        calculator = Dentaku::Calculator.new
        self.value = calculator.evaluate self.set_value
    end

end
