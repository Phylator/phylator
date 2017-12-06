class Equation < ApplicationRecord

    after_create :link_quantities_and_constants

    validates :equation, presence: true

    belongs_to :quantity, class_name: '::Quantity'

    has_many :calculation_equations, class_name: '::Calculation::Equation', dependent: :destroy
    has_many :calculations, through: :calculation_equations
    has_many :equation_quantities, class_name: '::Equation::Quantity', dependent: :destroy
    has_many :quantities, through: :equation_quantities
    has_many :equation_constants, class_name: '::Equation::Constant', dependent: :destroy
    has_many :constants, through: :equation_constants

    def pure_equation
        self.equation.tr('"', '')
    end

    private

    def link_quantities_and_constants
        calc = ::Dentaku::Calculator.new case_sensitive: true
        symbols = calc.dependencies self.pure_equation
        ::Quantity.all.each do |quantity|
            self.equation_quantities.create!(quantity: quantity) if symbols.include?(quantity.pure_sym)
        end
        ::Constant.all.each do |constant|
            self.equation_constants.create!(constant: constant) if symbols.include?(constant.pure_sym)
        end
    end

end
