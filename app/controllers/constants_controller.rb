class ConstantsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_constant

    def show
        turbolinks_animate 'fadeinright'
        @calculations = @constant.calculations.where(user: current_user).order('created_at desc')
        authorize! :read, @constant
        authorizes! :read, @calculations
        render layout: 'app/show'
    end

    private

    def set_constant
        @constant = Constant.friendly.find params[:id]
    end

end
