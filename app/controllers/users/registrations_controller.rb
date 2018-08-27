# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    layout 'devise', only: [:new]
    layout 'app', only: [:edit]

    def new
      turbolinks_animate 'fadein'
      super
    end

    def edit
      @purchases = current_user.purchases.order(created_at: :desc)
      turbolinks_animate 'fadein'
      super
    end

    def create
      super do |resource|
        unless calculation_param.blank?
          calculation = Calculation.friendly.find(app_param)
          calculation.update!(user: resource) unless calculation.user.present?
        end
      end
    end

    protected

    def calculation_param
      sign_up_params = devise_parameter_sanitizer.sanitize(:sign_up)
      sign_up_params[:calculation_id]
    end

    def sign_up_params
      sign_up_params = devise_parameter_sanitizer.sanitize(:sign_up)
      sign_up_params.delete(:calculation_id)
      sign_up_params
    end

    def after_sign_up_path_for(_resource)
      app_root_url
    end
  end
end
