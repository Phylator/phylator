# frozen_string_literal: true

module Fetch
  class Constant < Base
    def perform
      super do |dataset|
        locals = dataset.delete('locals')
        value = dataset.delete('value')
        constant = find_or_create(dataset)
        set_value(constant, value)
        update_translations(constant, locals)
      end
    end

    private

    # rubocop:disable Metrics/MethodLength
    def find_or_create(dataset)
      category = ::Category.find_by(name: dataset.delete('category'))
      dataset[:pack] =
        ::Pack.find_by(name: dataset.delete('pack'), category: category)
      dataset[:unit_of_measurement] =
        ::UnitOfMeasurement.find_by(name: dataset.delete('unit'))
      constant = ::Constant.find_by(name: dataset['name'])

      if constant.present?
        constant.update!(dataset)
        constant
      else
        ::Constant.create!(dataset)
      end
    end
    # rubocop:enable Metrics/MethodLength

    def set_value(constant, value)
      constant.set_value = value
      constant.save!
    end

    def update_translations(constant, locals)
      locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        constant.update!(translation)
      end
    end

    def url
      'https://raw.githubusercontent.com/Phylator/data/master/constants.json'
    end
  end
end
