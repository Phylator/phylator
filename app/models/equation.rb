class Equation < ApplicationRecord

    validates :equation, presence: true

    belongs_to :quantity, class_name: '::Quantity'

    has_many :calculation_equations, class_name: '::Calculation::Equation'
    has_many :calculations, through: :calculation_equations

end
