class Purchase < ApplicationRecord

    validates :amount, presence: true, numericality: true

    has_many :user
    has_many :pack

end
