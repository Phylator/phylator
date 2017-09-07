class Calculation::Result < ApplicationRecord

    self.table_name = 'calculation_results'

    has_many :equations, through: :belonging_equations
    has_many :belonging_equations, class_name: 'Equation', dependent: :destroy

    belongs_to :calculation, class_name: '::Calculation'

end
