# frozen_string_literal: true

class UnitOfMeasurementsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_unit_of_measurement, only: [:show]
  before_action :set_quantities, only: [:show]
  before_action :set_constants, only: [:show]
  before_action :set_si_prefixes, only: [:show]
  before_action :set_calculations, only: [:show]

  layout 'app/show', only: [:show]

  # rubocop:disable Style/MultilineIfModifier
  def index
    @units_of_measurement = Quantity.find(params[:quantity_id])
                                    .unit_of_measurements
                                    .with_translations(I18n.locale)
                                    .order(base: :desc)
    authorizes! :read, @units_of_measurement

    redirect_back(
      fallback_location: app_root_url,
      alert: I18n.t('unit_of_measurements.index.page_not_accessible')
    ) unless request.format == 'json'
  end
  # rubocop:enable Style/MultilineIfModifier

  def show
    turbolinks_animate 'fadeinright'
    calculator = Dentaku::Calculator.new case_sensitive: true
    @value = calculator.evaluate("1#{@unit_of_measurement.from_base}")
  end

  private

  def set_unit_of_measurement
    @unit_of_measurement = UnitOfMeasurement.friendly.find(params[:id])
    authorize! :read, @unit_of_measurement
  end

  def set_quantities
    @quantities = @unit_of_measurement.quantities
                                      .with_translations(I18n.locale)
                                      .order(:name)
    authorizes! :read, @quantities
  end

  def set_constants
    @constants = @unit_of_measurement.constants
                                     .with_translations(I18n.locale)
                                     .order(:name)
    authorizes! :read, @constants
  end

  def set_si_prefixes
    @si_prefixes = @unit_of_measurement.si_prefixes
                                       .with_translations(I18n.locale)
                                       .order(:name)
    authorizes! :read, @si_prefixes
  end

  def set_calculations
    @calculations = @unit_of_measurement.calculations.where(user: current_user)
                                        .order(created_at: :desc)
    authorizes! :read, @calculations
  end
end
