class QuantitiesController < ApplicationController

    include TurbolinksAnimateHelper

    before_action :authenticate_user!, only: [:show]
    before_action :set_quantity, only: [:show]

    # GET /quantities
    # GET /quantities.json
    def index
        turbolinks_animate 'fadein'
        render layout: 'app'
    end

    # GET /quantities/1
    # GET /quantities/1.json
    def show
        turbolinks_animate 'fadeinright'
        authorize! :read, @quantity
        render layout: 'details'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_quantity
        @quantity = Quantity.friendly.find(params[:id])
    end

end
