# frozen_string_literal: true

json.array! @json_quantities, partial: 'quantities/quantity', as: :quantity
