class Calculations::MeasurementsController < ApplicationController

    include TurbolinksAnimateHelper

    before_action :authenticate_user!, except: [:show]
    before_action :set_measurement, only: [:show, :update]

    load_and_authorize_resource param_method: :measurement_params

    # GET calculations/1/measurements/1
    # GET calculations/1/measurements/1.json
    def show
        turbolinks_animate 'fadeinright'
        render layout: 'details'
    end

    # PATCH/PUT /calculations/1
    # PATCH/PUT /calculations/1.json
    def update
        respond_to do |format|
            if @measurement.update(measurement_params)
                format.html { redirect_to calculation_measurement_url(@measurement.calculation.id, @measurement.id), notice: I18n.t('calculations.measurements.update.success') }
                format.json { render :show, status: :ok, location: @measurement }
            else
                format.html { render :edit }
                format.json { render json: @measurement.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
        @measurement = Calculation::Measurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
        params.require(:calculation_measurement).permit(:user_id, :quantity_id, :unit_of_measurement_id, :value, :margin_of_error, :name, :description)
    end

end
