class EquationsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_equation

    def show
        turbolinks_animate 'fadeinright'
        @quantities = @equation.quantities.with_translations(I18n.locale).order(:name)
        @constants = @equation.constants.with_translations(I18n.locale).order(:name)
        @calculations = @equation.calculations.where(user: current_user).order('created_at desc')
        authorize! :read, @equation
        authorizes! :read, @calculations
        render layout: 'app/show'
    end

    private

    def set_equation
        @equation = Equation.find params[:id]
    end

end
