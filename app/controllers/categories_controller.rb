# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_categories, only: [:index]
  before_action :set_category, only: [:show]
  before_action :set_packs, only: [:show]

  layout 'app', only: [:index]
  layout 'app/show', only: [:show]

  def index
    turbolinks_animate 'fadein'
  end

  def show
    turbolinks_animate 'fadeinright'
  end

  private

  def set_categories
    @categories = Category.all.with_translations(I18n.locale).order(:name)
    authorizes! :read, @categories
  end

  def set_category
    @category = Category.friendly.find(params[:id])
    authorize! :read, @category
  end

  def set_packs
    @packs = @category.packs.order(:price)
    authorizes! :read, @packs
  end
end
