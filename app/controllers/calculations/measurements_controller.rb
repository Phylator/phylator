class Calculations::MeasurementsController < ApplicationController

    before_action :authenticate_user!, except: [:show]
    before_action :set_measurement

    def show
        turbolinks_animate 'fadeinright'
        authorize! :read, @measurement
        render layout: 'app/show'
    end

    def update
        authorize! :update, @measurement
        if @measurement.update measurement_params
            redirect_to calculation_measurement_url(@measurement.calculation.id, @measurement.id), notice: I18n.t('calculations.measurements.update.success')
        else
            render :edit
        end
    end

    private

    def set_measurement
        @measurement = Calculation::Measurement.find(params[:id])
    end

    def measurement_params
        params.require(:calculation_measurement).permit(
            :user_id, :quantity_id, :unit_of_measurement_id,
            :value, :margin_of_error, :name, :description
        )
    end

end
