class PacksController < ApplicationController

    before_action :authenticate_user!
    before_action :set_pack

    def show
        turbolinks_animate({ desktop: 'fadein', mobile: 'fadeinright'})
        authorize! :read, @pack
        render layout: 'app/show'
    end

    private

    def set_pack
        @pack = Pack.friendly.find params[:id]
    end

end
