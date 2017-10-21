class ErrorsController < ApplicationController

    def not_found
        render layout: (current_user ? 'app' : 'application')
    end

end
