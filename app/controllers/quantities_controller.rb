class QuantitiesController < ApplicationController

    before_action :authenticate_user!, only: [:show]
    before_action :set_quantity, only: [:show]

    def index
        turbolinks_animate 'fadein'
        @quantities = (current_user ? Quantity.with_translations(I18n.locale).free + current_user.quantities.with_translations(I18n.locale) : Quantity.with_translations(I18n.locale).free).sort_by { |obj| obj.name }
        @constants = (current_user ? Constant.with_translations(I18n.locale).free + current_user.constants.with_translations(I18n.locale) : Constant.with_translations(I18n.locale).free).sort_by { |obj| obj.name }
        authorizes! :read, @quantities
        render layout: 'app'
    end

    def show
        turbolinks_animate 'fadeinright'
        authorize! :read, @quantity
        render layout: 'app/show'
    end

    private

    def set_quantity
        @quantity = Quantity.friendly.find params[:id]
    end

end
