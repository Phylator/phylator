# frozen_string_literal: true

module Fetch
  class Base
    def perform
      fetch_data.each do |dataset|
        yield(dataset)
      end
    end

    private

    def fetch_data
      JSON.parse(HTTParty.get(url).body)
    end
  end
end
