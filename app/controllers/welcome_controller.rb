class WelcomeController < ApplicationController

    def index
        redirect_to root_url if current_user || session[:setup]
        session[:setup] = true
    end

    def language
    end

    def drafts
        render layout: 'app'
    end

end
