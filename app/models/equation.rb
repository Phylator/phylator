class Equation < ApplicationRecord

    validates :equation, presence: true

    after_save :associate

    belongs_to :quantity, class_name: '::Quantity'

    has_many :equation_quantities, class_name: 'Quantity', source: :quantity, dependent: :destroy
    has_many :quantities, through: :equation_quantities

    has_many :calculation_equations, class_name: '::Calculation::Equation'
    has_many :calculations, through: :calculation_equations

    private

    def associate
        symbols = self.equation.split(/\W+/)
        symbols.each do |symbol|
            self.equation_quantities.create! quantity_id: ::Quantity.find_by(symbol: symbol).id
        end
    end

end
