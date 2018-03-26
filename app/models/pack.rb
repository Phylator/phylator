class Pack < ApplicationRecord

    extend FriendlyId
    include AlgoliaSearch
    friendly_id :name, use: :slugged
    translates :name, :description

    algoliasearch do
        Settings.phylator.languages.each do |lang|
            add_attribute "name_#{lang}" do
                Globalize.with_locale(lang) do
                    name
                end
            end
            add_attribute "description_#{lang}" do
                Globalize.with_locale(lang) do
                    description
                end
            end
        end
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
