# frozen_string_literal: true

module Fetch
  class Category
    def perform
      categories_data = fetch_categories_data
      categories_data.each do |category_data|
        locals = category_data.delete 'locals'
        category = find_or_create_category(category_data)
        update_translations(category, locals)
      end
    end

    private

    def fetch_categories_data
      JSON.parse(HTTParty.get(categories_url).body)
    end

    def find_or_create_category(category_data)
      category = Category.find_by name: category_data['name']
      if category.nil?
        category = Category.create! category_data
      else
        category.update! category_data
      end
    end

    def update_translations(category, locals)
      locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        category.update_attributes translation
      end
    end

    def categories_url
      'https://raw.githubusercontent.com/Phylator/data/master/categories.json'
    end
  end
end
