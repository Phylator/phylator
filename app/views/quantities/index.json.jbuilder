json.array! (Quantity.purchased(current_user) + Quantity.free), partial: 'quantities/quantity', as: :quantity
