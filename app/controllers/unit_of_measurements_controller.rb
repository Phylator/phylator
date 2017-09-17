class UnitOfMeasurementsController < ApplicationController

    # GET /unit_of_measurements.json
    def index
        @units_of_measurement = Quantity.find(params[:quantity_id]).unit_of_measurements
        redirect_back fallback_location: root_url, alert: 'Page not accessible' unless request.format == 'json'
    end

end
