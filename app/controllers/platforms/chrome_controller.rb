class ErrorsController < ApplicationController

    def index
        session[:scaling] = 'initial'
        redirect_to setup_url
    end

end
