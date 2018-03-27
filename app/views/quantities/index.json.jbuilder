json.array! (params[:all] ? Quantity.all.with_translations(I18n.locale).order(:name) : @quantities), partial: 'quantities/quantity', as: :quantity
