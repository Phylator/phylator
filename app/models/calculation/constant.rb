class Calculation::Constant < ApplicationRecord

    self.table_name = 'calculation_constants'

    belongs_to :calculation, class_name: '::Calculation'
    belongs_to :constant, class_name: '::Constant'

end
