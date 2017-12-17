class ErrorsController < ApplicationController

    include TurbolinksAnimateHelper

    def not_found
        turbolinks_animate 'fadein'
        render layout: (current_user ? 'app' : 'application')
    end

end
