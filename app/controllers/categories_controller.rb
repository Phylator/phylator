class CategoriesController < ApplicationController

    include TurbolinksAnimateHelper

    before_action :authenticate_user!
    before_action :set_category, only: [:show]

    def index
        turbolinks_animate 'fadein'
        @categories = Category.all
        render layout: 'app'
    end

    def show
        turbolinks_animate 'fadeinright'
        authorize! :read, @category
        render layout: 'details'
    end

    private

    def set_category
        @category = Category.friendly.find params[:id]
    end

end
