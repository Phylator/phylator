class EquationsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_equation

    def show
        turbolinks_animate({ desktop: 'fadein', mobile: 'fadeinright'})
        authorize! :read, @equation
        render layout: 'app/show'
    end

    private

    def set_equation
        @equation = Equation.find params[:id]
    end

end
