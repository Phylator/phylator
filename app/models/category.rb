class Category < ApplicationRecord

    extend FriendlyId
    friendly_id :name, use: :slugged
    translates :name, :description

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    has_many :packs

    def purchased? user
        purchased_packs = 0
        self.packs.each do |pack|
            purchased_packs += 1 if pack.purchased?(user) || pack.price == 0
        end

        if purchased_packs == self.packs.count
            0
        elsif purchased_packs > 0
            1
        else
            2
        end
    end

end
