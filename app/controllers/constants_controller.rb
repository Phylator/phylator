class ConstantsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_constant

    def show
        turbolinks_animate({ desktop: 'fadein', mobile: 'fadeinright'})
        authorize! :read, @constant
        render layout: 'app/show'
    end

    private

    def set_constant
        @constant = Constant.friendly.find params[:id]
    end

end
