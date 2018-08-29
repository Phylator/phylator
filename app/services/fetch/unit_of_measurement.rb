# frozen_string_literal: true

module Fetch
  class UnitOfMeasurement < Base
    def perform
      super do |dataset|
        locals = dataset.delete('locals')
        quantities = dataset.delete('quantities')
        dataset.delete('si_prefixes?')
        dataset.delete('base_symbol')
        dataset.delete('base_name')
        unit = find_or_create(dataset)
        add_to_quantities(unit, quantities)
        update_translations(unit, locals)
      end
    end

    private

    def find_or_create(dataset)
      unit = UnitOfMeasurement.find_by(name: unit['name'])

      if unit.present?
        unit.update!(dataset)
      else
        UnitOfMeasurement.create!(dataset)
      end
    end

    def add_to_quantities(unit, quantities)
      quantities&.each do |quantity|
        quantity = Quantity.find_by(name: quantity)
        next if unit.quantities.include?(quantity)

        unit.add_to_belonger!(quantity)
      end
    end

    def update_translations(unit, locals)
      locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        unit.update!(translation)
      end
    end

    def url
      'https://raw.githubusercontent.com/Phylator/data/master/units.json'
    end
  end
end
