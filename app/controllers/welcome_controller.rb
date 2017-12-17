class WelcomeController < ApplicationController

    include TurbolinksAnimateHelper

    def index
        turbolinks_animate 'fadein'
        unless params[:stay]
            redirect_to app_root_url if current_user || session[:setup]
        end
        session[:setup] = true
    end

    def language
        turbolinks_animate 'fadein'
    end

    def privacy
    end

    def product
    end

end
