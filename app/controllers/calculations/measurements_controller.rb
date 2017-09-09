class Calculations::MeasurementsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_measurement, only: [:show]

    # GET calculations/1/measurements/1
    # GET calculations/1/measurements/1.json
    def show
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Calculation::Measurement.find(params[:id])
    end

end
