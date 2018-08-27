# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    layout 'devise'

    def new
      turbolinks_animate 'fadein'
      super
    end

    def create
      super do |resource|
        unless calculation_param.blank?
          calculation = Calculation.find(calculation_param)
          calculation.update!(user: resource) unless calculation.user.present?
        end
      end
    end

    protected

    def calculation_param
      sign_in_params = devise_parameter_sanitizer.sanitize(:sign_in)
      sign_in_params[:calculation_id]
    end

    def sign_in_params
      sign_in_params = devise_parameter_sanitizer.sanitize(:sign_in)
      sign_in_params.delete(:calculation_id)
      sign_in_params
    end

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || app_root_url
    end
  end
end
