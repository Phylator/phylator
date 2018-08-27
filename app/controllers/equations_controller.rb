# frozen_string_literal: true

class EquationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_equation
  before_action :set_quantities
  before_action :set_constants
  before_action :set_calculations

  layout 'app/show'

  def show
    turbolinks_animate 'fadeinright'
  end

  private

  def set_equation
    @equation = Equation.find(params[:id])
    authorize! :read, @equation
  end

  def set_quantities
    @quantities = @equation.quantities.with_translations(I18n.locale)
                           .order(:name)
    authorizes! :read, @quantities
  end

  def set_constants
    @constants = @equation.constants.with_translations(I18n.locale).order(:name)
    authorizes! :read, @constants
  end

  def set_calculations
    @calculations = @equation.calculations.where(user: current_user)
                             .order(created_at: :desc)
    authorizes! :read, @calculations
  end
end
