# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :authenticate_user!

  layout 'app/show'

  def index
    turbolinks_animate 'fadeinright'
    @tab = params[:tab] || 'calculation'
    if params.has_key?(:content) && params[:content].is_a?(Array)
      @results = []
      case @tab
      when 'calculation'
        params[:content].each do |id|
          calculation = Calculation.find(id)
          @results << calculation if can?(:read, calculation)
        end
      when 'quantity'
        params[:content].each do |id|
          quantity = Quantity.find(id)
          @results << quantity if can?(:read, quantity)
        end
      when 'constant'
        params[:content].each do |id|
          constant = Constant.find(id)
          @results << constant if can?(:read, constant)
        end
      when 'pack'
        params[:content].each do |id|
          pack = Pack.find(id)
          @results << pack if can?(:read, pack)
        end
      end
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
