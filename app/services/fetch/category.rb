# frozen_string_literal: true

module Fetch
  class Category < Base
    def perform
      super do |dataset|
        locals = dataset.delete('locals')
        category = find_or_create(dataset)
        update_translations(category, locals)
      end
    end

    private

    def find_or_create(dataset)
      category = ::Category.find_by(name: dataset['name'])

      if category.present?
        category.update!(dataset)
        category
      else
        ::Category.create!(dataset)
      end
    end

    def update_translations(category, locals)
      locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        category.update!(translation)
      end
    end

    def url
      'https://raw.githubusercontent.com/Phylator/data/master/categories.json'
    end
  end
end
