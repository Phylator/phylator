class WelcomeController < ApplicationController

    before_action :authenticate_user!, only: [:drafts]

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

    def drafts
        @animation = 'fadein'
        render layout: 'app'
    end

    def privacy
    end

    def product
    end

end
