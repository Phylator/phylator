class Equation < ApplicationRecord

    validates :equation, presence: true

    belongs_to :quantity

    has_many :quantities, through: :belonging_quantities
    has_many :belonging_quantities, class_name: 'Equation::Quantitiy', dependent: :destroy

    has_many :results, through: :belonging_results
    has_many :belonging_results, class_name: 'Calculation::Result', dependent: :destroy

end
