class CategoriesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_category, only: [:show]

    def index
        @animation = 'fadein'
        @categories = Category.all
        render layout: 'app'
    end

    def show
        @animation = 'fadeinright'
        authorize! :read, @category
        render layout: 'details'
    end

    private

    def set_category
        @category = Category.friendly.find params[:id]
    end

end
