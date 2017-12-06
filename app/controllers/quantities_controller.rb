class QuantitiesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_quantity, only: [:show]

    # GET /quantities
    # GET /quantities.json
    def index
        @animation = 'fadein'
        render layout: 'app'
    end

    # GET /quantities/1
    # GET /quantities/1.json
    def show
        @animation = 'fadeinright'
        authorize! :read, @quantity
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_quantity
        @quantity = Quantity.friendly.find(params[:id])
    end

end
