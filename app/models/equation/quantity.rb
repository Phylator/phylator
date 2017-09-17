class Equation::Quantity < ApplicationRecord

    self.table_name = 'equation_quantities'

    belongs_to :equation, class_name: '::Equation'
    belongs_to :quantity, class_name: '::Quantity'

end
