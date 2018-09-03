# frozen_string_literal: true

module Fetch
  class Quantity < Base
    def perform
      super do |dataset|
        locals = dataset.delete('locals')
        quantity = find_or_create(dataset)
        update_translations(quantity, locals)
      end
    end

    private

    # rubocop:disable Metrics/MethodLength
    def find_or_create(dataset)
      category = ::Category.find_by(name: dataset.delete('category'))
      dataset['pack'] =
        ::Pack.find_by(name: dataset.delete('pack'), category: category)
      dataset['parent_quantity'] =
        ::Quantity.find_by(name: dataset.delete('parent_quantity'))

      if (quantity = ::Quantity.find_by(name: dataset['name']))
        quantity.update!(dataset)
        quantity
      else
        ::Quantity.create!(dataset)
      end
    end
    # rubocop:enable Metrics/MethodLength

    def update_translations(quantity, locals)
      locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        quantity.update!(translation)
      end
    end

    def url
      'https://raw.githubusercontent.com/Phylator/data/master/quantities.json'
    end
  end
end
