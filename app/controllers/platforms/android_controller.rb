class Platforms::AndroidController < ApplicationController

    def index
        session[:nativeGapScalingEnabled] = 'true'
        redirect_to setup_url
    end

end
