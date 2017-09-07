class Calculation::Equation < ApplicationRecord

    self.table_name = 'calculation_equations'

    belongs_to :result, class_name: 'Result'
    belongs_to :equation, class_name: '::Equation'

end
