# frozen_string_literal: true

class QuantitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quantities, only: [:index]
  before_action :set_json_quantities, only: [:index]
  before_action :set_constants, only: [:index]
  before_action :set_quantity, only: [:show]
  before_action :set_equations, only: [:show]
  before_action :set_child_quantities, only: [:show]
  before_action :set_unit_of_measurements, only: [:show]
  before_action :set_calculations, only: [:show]

  layout 'app', only: [:index]
  layout 'app/show', only: [:show]

  def index
    turbolinks_animate 'fadein'
  end

  def show
    turbolinks_animate 'fadeinright'
  end

  private

  def set_quantities
    @quantities = Quantity.base.with_translations(I18n.locale).free
    if current_user
      @quantities += current_user.quantities.base.with_translations(I18n.locale)
    end
    @quantities.sort_by(&:name)
    authorizes! :read, @quantities
  end

  def set_json_quantities
    if params[:all]
      @json_quantities =
        Quantity.all.with_translations(I18n.locale).order(:name)
    else
      @json_quantities = @quantities
    end
    authorizes! :read, @json_quantities
  end

  def set_constants
    @constants = Constant.with_translations(I18n.locale).free
    if current_user
      @constants += current_user.constants.with_translations(I18n.locale)
    end
    @constants.sort_by(&:name)
    authorizes! :read, @constants
  end

  def set_quantity
    @quantity = Quantity.friendly.find(params[:id])
    authorize! :read, @quantity
  end

  def set_equations
    @equations =
      @quantity.equations.with_translations(I18n.locale).group_by(&:title)
    authorizes! :read, @equations
  end

  def set_child_quantities
    @quantities =
      @quantity.child_quantities.with_translations(I18n.locale).order(:name)
    authorizes! :read, @quantities
  end

  def set_unit_of_measurements
    @unit_of_measurements = @quantity.unit_of_measurements.base
                                     .with_translations(I18n.locale)
                                     .order(base: :desc)
    authorizes! :read, @unit_of_measurements
  end

  def set_calculations
    @equations =
      @quantity.calculations.where(user: current_user).order('created_at desc')
    authorizes! :read, @equations
  end
end
