# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength
class CalculationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  before_action :set_calculation, only: [:show, :edit, :update, :destroy,
                                         :share]
  before_action :set_new_calculation, only: [:what, :how, :measurements]

  layout 'app', only: [:index]
  layout 'app/show', only: [:show]

  def index
    turbolinks_animate 'fadein'
    @calculations = current_user.calculations.order(created_at: :desc)
    authorizes! :read, @calculations
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def show
    turbolinks_animate 'fadeinright'
    @dependencies = @calculation.missing_equations
    @measurements = @calculation.measurements
    @constants =
      @calculation.constants.with_translations(I18n.locale).order(:name)
    @equations = @calculation.equations
    @conditions = @equations.dup.map(&:conditions).flatten
    authorize! :read, @calculation
    authorizes! :read, @constants
    authorizes! :read, @equations
    authorizes! :read, @dependencies
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

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

  def edit
    authorize! :update, @calculation
    modalist
  end

  def update
    authorize! :update, @calculation
    if @calculation.update calculation_params
      redirect_to @calculation, notice: I18n.t('calculations.update.success')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @calculation
    @calculation.destroy
    redirect_to (current_user ? calculations_url : app_root_url),
                notice: I18n.t('calculations.destroy.success')
  end

  def what
    turbolinks_animate 'fadein'
    @categories = @calculation.quantity.equations.map(&:title).uniq
    redirect_to how_url(params) if @categories.none?

    render layout: current_user ? 'app' : 'mozaic'
  end

  def how
    turbolinks_animate 'fadein'
    @equations = @calculation.quantity.equations.where(title: params[:category])
    redirect_to app_root_url if @equations.none?

    render layout: current_user ? 'app' : 'mozaic'
  end

  def measurements
    turbolinks_animate 'fadein'
    build_measurements

    render layout: current_user ? 'app' : 'mozaic'
  end

  def share
    modalist
  end

  private

  def set_calculation
    @calculation = Calculation.find(params[:id] || params[:calculation_id])
  end

  def set_new_calculation
    redirect_to app_root_url unless params.key?(:quantity) && params.key?(:unit)

    @calculation = Calculation.new(quantity_id: params[:quantity],
                                   unit_of_measurement_id: params[:unit])
    authorize! :create, @calculation
  end

  def build_measurements
    Equation.find_by(id: params[:equation])&.quantities&.each do |quantity|
      @calculation.measurements.new(quantity: quantity)
    end
    @calculation.measurements.new unless @calculation.measurements.any?
  end

  def calculation_params
    params.require(:calculation).permit(
      :user_id, :quantity_id, :unit_of_measurement_id,
      :name, :description,
      measurements_attributes: [:value, :margin_of_error, :quantity_id,
                                :unit_of_measurement_id, :_destroy]
    )
  end
end
# rubocop:enable Metrics/ClassLength
