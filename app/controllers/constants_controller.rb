# frozen_string_literal: true

class ConstantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_constant
  before_action :set_calculations

  layout 'app/show'

  def show
    turbolinks_animate 'fadeinright'
  end

  private

  def set_constant
    @constant = Constant.friendly.find(params[:id])
    authorize! :read, @constant
  end

  def set_calculations
    @calculations = @constant.calculations.where(user: current_user)
                             .order(created_at: :desc)
    authorizes! :read, @calculations
  end
end
