class QuantitiesController < ApplicationController

    before_action :authenticate_user!, only: [:show]
    before_action :set_quantity, only: [:show]

    # GET /quantities
    # GET /quantities.json
    def index
        render layout: 'app'
        @quantities = Quantity.all
    end

    # GET /quantities/1
    # GET /quantities/1.json
    def show
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_quantity
      @quantity = Quantity.friendly.find(params[:id])
    end

end
