class SearchController < ApplicationController

    include TurbolinksAnimateHelper

    before_action :authenticate_user!

    def index
        turbolinks_animate 'fadeinright'
        render layout: 'details'
    end

    def renderer
        render layout: false
    end

end
