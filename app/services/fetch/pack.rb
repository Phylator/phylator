# frozen_string_literal: true

module Fetch
  class Pack
    def perform
      packs_data = fetch_packs_data
      packs_data.each do |pack_data|
        locals = pack_data.delete('locals')
        pack = find_or_create_pack(pack_data)
        update_translations(pack, locals)
      end
    end

    private

    def fetch_packs_data
      JSON.parse(HTTParty.get(packs_url).body)
    end

    def find_or_create_pack(pack_data)
      pack_data['category'] =
        Category.find_by(name: pack_data.delete('category'))
      pack =
        Pack.find_by(name: pack_data['name'], category: pack_data['category'])

      if pack.present?
        pack.update!(pack_data)
      else
        Pack.create!(pack_data)
      end
    end

    def update_translations(pack, locals)
      locals.each do |locale, translation|
        translation[:locale] = locale.to_sym
        pack.update!(translation)
      end
    end

    def packs_url
      'https://raw.githubusercontent.com/Phylator/data/master/packs.json'
    end
  end
end
