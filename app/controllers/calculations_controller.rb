class CalculationsController < ApplicationController

    include TurbolinksAnimateHelper

    before_action :authenticate_user!, except: [:new, :create, :show]
    before_action :set_calculation, only: [:show, :edit, :update, :destroy]

    load_and_authorize_resource param_method: :calculation_params

    # GET /calculations
    # GET /calculations.json
    def index
        turbolinks_animate 'fadein'
        render layout: 'app'
    end

    # GET /calculations/1
    # GET /calculations/1.json
    def show
        turbolinks_animate 'fadeinright'
        render layout: 'details'
    end

    # GET /calculations/new
    def new
        turbolinks_animate 'fadein'
        @calculation = Calculation.new
        @calculation.measurements.build
        render layout: (current_user ? 'app' : 'application')
    end

    # POST /calculations
    # POST /calculations.json
    def create
        @calculation = Calculation.new calculation_params
        @calculation.user = current_user if current_user

        respond_to do |format|
            if @calculation.save
                format.html { redirect_to @calculation, notice: I18n.t('calculations.create.success') }
                format.json { render :show, status: :created, location: @calculation }
            else
                format.html { redirect_to app_root_url, alert: I18n.t('calculations.create.error') }
                format.json { render json: @calculation.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /calculations/1
    # PATCH/PUT /calculations/1.json
    def update
        respond_to do |format|
            if @calculation.update calculation_params
                format.html { redirect_to @calculation, notice: I18n.t('calculations.update.success') }
                format.js
                format.json { render :show, status: :ok, location: @calculation }
            else
                format.html { render :edit }
                format.js
                format.json { render json: @calculation.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /calculations/1
    # DELETE /calculations/1.json
    def destroy
        @calculation.destroy
        respond_to do |format|
            format.html { redirect_to (current_user ? calculations_url : app_root_url), notice: I18n.t('calculations.destroy.success') }
            format.js
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_calculation
        @calculation = Calculation.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calculation_params
        params.require(:calculation).permit(:user_id, :quantity_id, :unit_of_measurement_id, :name, :description, measurements_attributes: [:value, :margin_of_error, :quantity_id, :unit_of_measurement_id, :_destroy])
    end

end
