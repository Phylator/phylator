class ErrorsController < ApplicationController

    def not_found
        @animation = 'fadein'
        render layout: (current_user ? 'app' : 'application')
    end

end
