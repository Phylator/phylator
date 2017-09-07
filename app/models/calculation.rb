class Calculation < ApplicationRecord

    acts_as_taggable

    has_one :result, class_name: 'Calculation::Result'
    has_many :measurements, class_name: 'Calculation::Measurement'

    belongs_to :user

end
