json.array! (Quantity.purchased(current_user).base + Quantity.free.base), partial: 'quantities/quantity', as: :quantity
