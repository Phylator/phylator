# frozen_string_literal: true

json.extract! quantity, :id, :name, :symbol, :sym, :created_at, :updated_at
json.url quantity_url(quantity, format: :json)
