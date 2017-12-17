class EquationsController < ApplicationController

    include TurbolinksAnimateHelper

    before_action :authenticate_user!
    before_action :set_equation

    # GET /equations/1
    # GET /equations/1.json
    def show
        turbolinks_animate 'fadeinright'
        authorize! :read, @equation
        render layout: 'details'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_equation
        @equation = Equation.find params[:id]
    end

end
