class Calculation::Result < ApplicationRecord

    self.table_name = 'calculation_results'

    after_create :calc

    has_many :equations, through: :belonging_equations
    has_many :belonging_equations, class_name: 'Equation', dependent: :destroy

    belongs_to :calculation, class_name: '::Calculation'

    private

    def calc
    end

end
