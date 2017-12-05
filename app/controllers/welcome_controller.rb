class WelcomeController < ApplicationController

    def index
        @animation = 'fadein'
        unless params[:stay]
            redirect_to app_root_url if current_user || session[:setup]
        end
        session[:setup] = true
    end

    def language
        @animation = 'fadein'
    end

    def privacy
    end

    def product
    end

end
