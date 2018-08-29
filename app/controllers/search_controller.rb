# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tab
  before_action :set_results

  layout 'app/show'

  def index
    turbolinks_animate 'fadeinright'

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_tab
    @tab = params[:tab] || 'calculation'
  end

  def set_results
    return unless params[:content]&.is_a?(Array)

    params[:content].map do |id|
      current_class.find(id)
    end.compact
    @results = params[:content].select { |record| can?(:read, record) }
  end

  def current_class
    @tab.camelize.constantize
  end
end
