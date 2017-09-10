class Equation < ApplicationRecord

    validates :equation, presence: true

    after_validation :associate

    belongs_to :quantity

    has_many :quantities, through: :belonging_quantities
    has_many :belonging_quantities, class_name: '::Equation::Quantitiy', dependent: :destroy

    private

    def associate
        symbols = self.equation.split(/\W+/)
        symbols.each do |symbol|
            self.belonging_quantities.create! quantity_id: Quantity.find_by(symbol: symbol).id
        end
    end

end
