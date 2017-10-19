class WelcomeController < ApplicationController

    before_action :authenticate_user!, only: [:drafts]

    def index
        unless params[:stay]
            redirect_to app_root_url if current_user || session[:setup]
        end
        session[:setup] = true
    end

    def language
    end

    def drafts
        render layout: 'app'
    end

    def privacy
    end

    def product
    end

end
