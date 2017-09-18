class Calculation::Equation < ApplicationRecord

    self.table_name = 'calculation_equations'

    belongs_to :calculation, class_name: '::Calculation'
    belongs_to :equation, class_name: '::Equation'

end
