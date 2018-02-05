class SearchController < ApplicationController

    before_action :authenticate_user!

    def index
        turbolinks_animate { desktop: 'fadein', mobile: 'fadeinright' }
        render layout: 'app/show'
    end

    def renderer
        render layout: false
    end

end
