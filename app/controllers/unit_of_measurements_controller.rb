class UnitOfMeasurementsController < ApplicationController

    # GET /unit_of_measurements.json
    def index
        @units_of_measurement = Quantity.find(params[:quantity_id]).unit_of_measurements
        redirect_back fallback_location: app_root_url, alert: I18n.t('cd.page_not_accessible') unless request.format == 'json'
    end

end
