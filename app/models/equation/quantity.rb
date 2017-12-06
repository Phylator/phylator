class Equation::Quantity < ApplicationRecord

    self.table_name = 'equation_quantities'

    belongs_to :quantity, class_name: '::Quantity'
    belongs_to :equation, class_name: '::Equation'

end
