class UnitOfMeasurementsController < ApplicationController

    include TurbolinksAnimateHelper

    before_action :authenticate_user!, only: [:show]
    before_action :set_unit_of_measurement, only: [:show]

    # GET /unit_of_measurements.json
    def index
        @units_of_measurement = Quantity.find(params[:quantity_id]).unit_of_measurements
        redirect_back fallback_location: app_root_url, alert: I18n.t('cd.page_not_accessible') unless request.format == 'json'
    end

    # GET /unit_of_measurements/1
    # GET /unit_of_measurements/1.json
    def show
        turbolinks_animate 'fadeinright'
        authorize! :read, @unit_of_measurement

        calculator = Dentaku::Calculator.new case_sensitive: true
        @value = calculator.evaluate '1' + @unit_of_measurement.from_base

        render layout: 'details'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_unit_of_measurement
        @unit_of_measurement = UnitOfMeasurement.find params[:id]
    end

end
