class PacksController < ApplicationController

    include TurbolinksAnimateHelper

    before_action :authenticate_user!
    before_action :set_pack

    def show
        turbolinks_animate 'fadeinright'
        authorize! :read, @pack
        render layout: 'details'
    end

    private

    def set_pack
        @pack = Pack.friendly.find params[:id]
    end

end
