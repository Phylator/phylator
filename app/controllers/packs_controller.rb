class PacksController < ApplicationController

    before_action :authenticate_user!
    before_action :set_pack

    def show
        @animation = 'fadeinright'
        authorize! :read, @pack
    end

    private

    def set_pack
        @pack = Pack.friendly.find params[:id]
    end

end
