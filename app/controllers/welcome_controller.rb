class WelcomeController < ApplicationController

    layout 'mozaic', only: [:setup]

    def index
        turbolinks_animate 'fadein'
    end

    def setup
        turbolinks_animate 'fadein'
        redirect_to app_root_url if !params[:stay] && ( current_user || session[:setup] )
        session[:setup] = true
    end

    def language
        modalist
    end

end
