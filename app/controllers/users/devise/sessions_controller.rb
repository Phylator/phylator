class Users::Devise::SessionsController < Devise::SessionsController

    include TurbolinksAnimateHelper

    def new
        turbolinks_animate 'fadein'
        super
    end

    def create
        self.resource = warden.authenticate! auth_options
        set_flash_message! :notice, :signed_in
        sign_in resource_name, resource
        if calculation_param != ''
            calculation = ::Calculation.find calculation_param
            calculation.update! user_id: current_user.id if calculation.user_id.nil?
        end
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
    end

    protected

    def calculation_param
        sign_in_params = devise_parameter_sanitizer.sanitize :sign_in
        sign_in_params[:calculation_id]
    end

    def sign_in_params
        sign_in_params = devise_parameter_sanitizer.sanitize :sign_in
        sign_in_params.delete :calculation_id
        sign_in_params
    end

end
