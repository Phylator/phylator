class SearchController < ApplicationController

    before_action :authenticate_user!

    layout 'app/show'

    def index
        turbolinks_animate 'fadeinright'
        respond_to do |format|
            format.html
            format.js
        end
    end

end
