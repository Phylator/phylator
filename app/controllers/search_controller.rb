class SearchController < ApplicationController

    before_action :authenticate_user!

    layout 'app/show'

    def index
        turbolinks_animate({ desktop: 'fadein', mobile: 'fadeinright'})
        respond_to do |format|
            format.html
            format.js
        end
    end

end
