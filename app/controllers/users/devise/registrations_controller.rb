class Users::Devise::RegistrationsController < Devise::RegistrationsController

    include TurbolinksAnimateHelper

    def new
        turbolinks_animate 'fadein'
        super
    end

    def edit
        turbolinks_animate 'fadein'
        super
    end

    def create
        build_resource sign_up_params

        resource.save
        yield resource if block_given?
        if resource.persisted?
            if resource.active_for_authentication?
                set_flash_message! :notice, :signed_up
                sign_up resource_name, resource
                if calculation_param != ''
                    calculation = ::Calculation.find calculation_param
                    calculation.update! user_id: current_user.id if calculation.user_id.nil?
                end
                respond_with resource, location: after_sign_up_path_for(resource)
            else
                set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
                expire_data_after_sign_in!
                respond_with resource, location: after_inactive_sign_up_path_for(resource)
            end
        else
            clean_up_passwords resource
            set_minimum_password_length
            respond_with resource
        end
    end

    protected

    def calculation_param
        sign_up_params = devise_parameter_sanitizer.sanitize :sign_up
        sign_up_params[:calculation_id]
    end

    def sign_up_params
        sign_up_params = devise_parameter_sanitizer.sanitize :sign_up
        sign_up_params.delete :calculation_id
        sign_up_params
    end

end
