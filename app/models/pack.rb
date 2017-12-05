class Pack < ApplicationRecord

    extend FriendlyId
    friendly_id :name, use: :slugged
    translates :name, :description

    validates :price, presence: true, numericality: true
    validates :name, presence: true
    validates :description, presence: true

    has_many :purchases
    has_many :quantities
    has_many :constants
    belongs_to :category

    def purchased? user
        return true if self.purchases.where(user_id: user.id).any? || self.price == 0
        false
    end

end
