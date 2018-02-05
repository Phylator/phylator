module LayoutHelper

    # Returns app layout based on user
    def current_layout
        current_user ? 'app' : 'application'
    end

end
