class Purchase < ApplicationRecord

    validates :amount, presence: true, numericality: true

    belongs_to :user
    belongs_to :pack

end
