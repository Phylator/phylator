class WelcomeController < ApplicationController

    def index
        turbolinks_animate 'fadein'
    end

    def setup
        turbolinks_animate 'fadein'
        redirect_to app_root_url if !params[:stay] && ( current_user || session[:setup] )
        session[:setup] = true
    end

    def language
        turbolinks_animate 'fadein'
    end

    def privacy
        turbolinks_animate 'fadein'
    end

end
