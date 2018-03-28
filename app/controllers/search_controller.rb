class SearchController < ApplicationController

    before_action :authenticate_user!

    layout 'app/show'

    def index
        turbolinks_animate 'fadeinright'
        @tab = params[:tab] || 'calculation'
    end

end
