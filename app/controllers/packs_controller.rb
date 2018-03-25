class PacksController < ApplicationController

    before_action :authenticate_user!
    before_action :set_pack

    def show
        turbolinks_animate 'fadeinright'
        @quantities = @pack.quantities.with_translations(I18n.locale).order(:name)
        @constants = @pack.constants.with_translations(I18n.locale).order(:name)
        authorize! :read, @pack
        render layout: 'app/show'
    end

    def checkout
        authorize! :read, @pack
        modalist
    end

    private

    def set_pack
        @pack = Pack.friendly.find params[:id]
    end

end
