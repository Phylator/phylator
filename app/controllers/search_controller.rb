class SearchController < ApplicationController

    before_action :authenticate_user!

    def index
        @animation = 'fadeinright'
        render layout: 'details'
    end

    def renderer
        render layout: false
    end

end
