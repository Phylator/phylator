# frozen_string_literal: true

module Fetch
  class Quantity
    def perform
      quantities_data = fetch_quantities_data
      quantities_data.each do |quantity_data|
        locals = quantity_data.delete('locals')
        quantity = find_or_create_quantity(quantity_data)
        update_translations(quantity, locals)
      end
    end

    private

    def fetch_quantities_data
      JSON.parse(HTTParty.get(quantities_url).body)
    end

    def find_or_create_quantity(quantity_data)
      category = Category.find_by(name: quantity_data.delete('category'))
      quantity_data['pack'] =
        Pack.find_by(name: quantity_data.delete('pack'), category: category)
      quantity_data['parent_quantity'] =
        Quantity.find_by(name: quantity_data.delete('parent_quantity'))

      if (quantity = Quantity.find_by(name: quantity_data['name']))
        quantity.update!(quantity_data)
      else
        Quantity.create!(quantity_data)
      end
    end

    def update_translations(quantity, locals)
      locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        quantity.update!(translation)
      end
    end

    def quantities_url
      'https://raw.githubusercontent.com/Phylator/data/master/quantities.json'
    end
  end
end
