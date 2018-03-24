class QuantitiesController < ApplicationController

    before_action :authenticate_user!, only: [:show]
    before_action :set_quantity, only: [:show]

    def index
        turbolinks_animate 'fadein'
        @quantities = current_user ? Quantity.free + current_user.quantities : Quantity.free
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
