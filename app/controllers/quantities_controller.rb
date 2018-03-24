class QuantitiesController < ApplicationController

    before_action :authenticate_user!, only: [:show]
    before_action :set_quantity, only: [:show]

    def index
        turbolinks_animate 'fadein'
        @quantities = Quantity.all
        # authorizes! :read, @quantities
        render layout: 'app'
    end

    def show
        turbolinks_animate({ desktop: 'fadein', mobile: 'fadeinright'})
        authorize! :read, @quantity
        render layout: 'app/show'
    end

    private

    def set_quantity
        @quantity = Quantity.friendly.find params[:id]
    end

end
