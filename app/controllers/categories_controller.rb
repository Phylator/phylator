class CategoriesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_category, only: [:show]

    def index
        turbolinks_animate 'fadein'
        @categories = Category.all.with_translations(I18n.locale).order(:name)
        authorizes! :read, @categories
        render layout: 'app'
    end

    def show
        turbolinks_animate 'fadeinright'
        @packs = @category.packs.order(:price)
        authorize! :read, @category
        authorizes! :read, @packs
        render layout: 'app/show'
    end

    private

    def set_category
        @category = Category.friendly.find params[:id]
    end

end
