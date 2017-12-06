class Calculation::Dependency < ApplicationRecord

    self.table_name = 'calculation_dependencies'

    validates :index, presence: true, numericality: true

    belongs_to :calculation, class_name: '::Calculation'
    belongs_to :quantity, class_name: '::Quantity'

end
