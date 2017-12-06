class Equation::Constant < ApplicationRecord

    self.table_name = 'equation_constants'

    belongs_to :constant, class_name: '::Constant'
    belongs_to :equation, class_name: '::Equation'

end
