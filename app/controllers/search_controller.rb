class SearchController < ApplicationController

    before_action :authenticate_user!

    layout 'app/show'

    def index
        turbolinks_animate 'fadeinright'
        @tab = params[:tab] || 'calculation'
        if params.has_key?(:content)
            @results = []
            case @tab
            when 'calculation'
                content.each { |r| @results << Calculation.find(r['objectID']) }
            when 'quantity'
                content.each { |r| @results << Quantity.find(r['objectID']) }
            when 'constant'
                content.each { |r| @results << Constant.find(r['objectID']) }
            when 'pack'
                content.each { |r| @results << Pack.find(r['objectID']) }
            end
        end
        respond_to do |format|
            format.html
            format.js
        end
    end

end
