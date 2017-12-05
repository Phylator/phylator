class CategoriesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_category, only: [:show]

    def index
        @animation = 'fadein'
        render layout: 'app'
        @categories = Category.all
    end

    def show
        @animation = 'fadeinright'
        authorize! :read, @category
    end

    private

    def set_category
        @category = Category.friendly.find params[:id]
    end

end
