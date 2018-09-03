# frozen_string_literal: true

module Fetch
  class Pack < Base
    def perform
      super do |dataset|
        locals = dataset.delete('locals')
        pack = find_or_create(dataset)
        update_translations(pack, locals)
      end
    end

    private

    def find_or_create(dataset)
      dataset['category'] =
        ::Category.find_by(name: dataset.delete('category'))
      pack =
        ::Pack.find_by(name: dataset['name'], category: dataset['category'])

      if pack.present?
        pack.update!(dataset)
        pack
      else
        ::Pack.create!(dataset)
      end
    end

    def update_translations(pack, locals)
      locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        pack.update!(translation)
      end
    end

    def url
      'https://raw.githubusercontent.com/Phylator/data/master/packs.json'
    end
  end
end
