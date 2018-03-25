class CalculationsController < ApplicationController

    before_action :authenticate_user!, except: [:new, :create, :show, :what, :how, :measurements]
    before_action :set_calculation, only: [:show, :edit, :update, :destroy]

    layout 'app'

    def index
        turbolinks_animate 'fadein'
        @calculations = current_user.calculations.order('created_at desc')
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

    def what
        turbolinks_animate 'fadein'
        @calculation = Calculation.new quantity_id: params[:quantity], unit_of_measurement_id: params[:unit]
        authorize! :create, @calculation
        @categories = @calculation.quantity.equations.map { |e| e.title }
        if !params.has_key?(:quantity) && !params.has_key?(:unit)
            redirect_to app_root_url
        elsif !@categories.any?
            redirect_to how_url(quantity: params[:quantity], unit: params[:unit])
        else
            render layout: current_user ? 'app' : 'mozaic'
        end
    end

    def how
        turbolinks_animate 'fadein'
        redirect_to app_root_url unless params.has_key?(:quantity) || params.has_key?(:unit)
        @calculation = Calculation.new quantity_id: params[:quantity], unit_of_measurement_id: params[:unit]
        authorize! :create, @calculation
        @equations = @calculation.quantity.equations.where(title: params[:category]) if params.has_key?(:category)
        redirect_to app_root_url if @equations.nil? || !@equations.any?
        render layout: current_user ? 'app' : 'mozaic'
    end

    def measurements
        turbolinks_animate 'fadein'
        redirect_to app_root_url unless params.has_key?(:quantity) || params.has_key?(:unit)
        @calculation = Calculation.new quantity_id: params[:quantity], unit_of_measurement_id: params[:unit]
        authorize! :create, @calculation
        if params.has_key?(:equation) && Equation.where(id: params[:equation]).any?
            equation = Equation.find(params[:equation])
            equation.quantities.each do |quantity|
                @calculation.measurements.new quantity: quantity
            end
        else
            @calculation.measurements.new
        end
        render layout: current_user ? 'app' : 'mozaic'
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
