class Quantity < ApplicationRecord

    # acts_as_taggable
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged
    translates :name, :description

    validates :symbol, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    has_many :unit_of_measurements
    has_many :equations
    has_many :measurements, class_name: 'Calculation::Measurement'

    has_many :belongs_to_equations, through: :equation_quantities, source: :equation
    has_many :equation_quantities, class_name: 'Equation::Quantity', dependent: :destroy

    def sym
        self.symbol.html_safe
    end
    def pure_sym
        self.symbol.sub('<sub>', '').sub('</sub>', '')
    end

    private

    def slug_candidates
        [:name]
    end

end
