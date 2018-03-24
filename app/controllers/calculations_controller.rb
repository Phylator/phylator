class CalculationsController < ApplicationController

    before_action :authenticate_user!, except: [:new, :create, :show]
    before_action :set_calculation, only: [:show, :edit, :update, :destroy]

    layout 'app'

    def index
        turbolinks_animate 'fadein'
        @calculations = Calculation.all
        authorizes! :read, @calculations
    end

    def show
        turbolinks_animate 'fadeinright'
        authorize! :read, @calculation
        render layout: 'app/show'
    end

    def new
        turbolinks_animate 'fadein'
        @calculation = Calculation.new
        @calculation.measurements.build
        authorize! :create, @calculation
        render layout: current_user ? 'app' : 'mozaic'
    end

    def create
        @calculation = Calculation.new calculation_params
        @calculation.user = current_user if current_user
        authorize! :create, @calculation

        if @calculation.save
            redirect_to @calculation, notice: I18n.t('calculations.create.success')
        else
            redirect_to app_root_url, alert: I18n.t('calculations.create.error')
        end
    end

    def update
        authorize! :update, @calculation
        respond_to do |format|
            if @calculation.update calculation_params
                format.html { redirect_to @calculation, notice: I18n.t('calculations.update.success') }
                format.js
            else
                format.html { render :edit }
                format.js
            end
        end
    end

    def destroy
        authorize! :destroy, @calculation
        @calculation.destroy
        respond_to do |format|
            format.html { redirect_to (current_user ? calculations_url : app_root_url), notice: I18n.t('calculations.destroy.success') }
            format.js
        end
    end

    private

    def set_calculation
        @calculation = Calculation.find params[:id]
    end

    def calculation_params
        params.require(:calculation).permit(
            :user_id, :quantity_id, :unit_of_measurement_id,
            :name, :description,
            measurements_attributes: [:value, :margin_of_error, :quantity_id, :unit_of_measurement_id, :_destroy]
        )
    end

end
