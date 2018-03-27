- if params[:all] == true
    json.array! Quantity.all, partial: 'quantities/quantity', as: :quantity
- else
    json.array! @quantities, partial: 'quantities/quantity', as: :quantity
