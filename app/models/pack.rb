class Pack < ApplicationRecord

    extend FriendlyId
    include AlgoliaSearch
    friendly_id :name, use: :slugged
    translates :name, :description

    algoliasearch do
        attribute :name, :description
        add_attribute :algolia_category
    end
    def algolia_category
        self.category.name
    end

    validates :price, presence: true, numericality: true
    validates :name, presence: true
    validates :description, presence: true

    has_many :purchases
    has_many :quantities
    has_many :constants
    belongs_to :category

    scope :free, -> { where(price: 0) }

    def purchased? user
        return true if self.purchases.where(user_id: user.id).any? || self.price == 0
        false
    end

end
