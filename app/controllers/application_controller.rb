class ApplicationController < ActionController::Base


    protect_from_forgery with: :exception, prepend: true


    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :store_current_location, unless: :devise_controller?
    before_action :set_animation, if: :devise_controller?
    helper_method :current_user
    before_action :set_raven_context
    before_action :set_locale


    include R404Renderer
    rescue_from CanCan::AccessDenied do |exception|
        render_r404 :access_denied, 403, exception
    end
    rescue_from ActiveRecord::RecordNotFound, AbstractController::ActionNotFound, ActionController::RoutingError do |exception|
        render_r404 :not_found, 404, exception
    end


    def current_ability
        @current_ability ||= Ability.new current_user
    end
    def authorizes! ability, collection
        collection&.select { |object| authorize! ability, object }
    end



    protected



    def configure_permitted_parameters
        devise_parameter_sanitizer.permit :sign_up, keys: [:calculation_id]
        devise_parameter_sanitizer.permit :sign_in, keys: [:calculation_id]
    end
    
    def set_animation
        @animation = 'fadein'
    end

    def after_sign_in_path_for resource
        stored_location_for(resource) || app_root_url
    end
    def after_sign_up_path_for resource
        language_url
    end



    private



    def render_r404_access_denied format, status, exception
        format.html { redirect_back fallback_location: root_url, alert: 'You are unauthorized to perform this action' }
    end


    def set_locale
        ## explicit param can always override existing setting
        ## otherwise, make sure to allow a user preference to override any automatic detection
        ## then detect by location, and header
        ## if all else fails, fall back to default
        I18n.locale = params[:locale] || user_pref_locale || session[:locale] || location_detected_locale || header_detected_locale || I18n.default_locale

        ## save to session
        session[:locale] = I18n.locale

        ## save to user
        if current_user && I18n.locale != current_user.locale
            current_user.locale = I18n.locale
            current_user.save!
        end
    end
    def user_pref_locale
        return nil unless current_user && current_user.locale.present?
        current_user.locale
    end
    def location_detected_locale
        language = browser.accept_language.first
        return nil unless language.present? && language.code.present? && I18n.available_locales.include?(language.code)
        language.code
    end
    def header_detected_locale
        if request.env['HTTP_ACCEPT_LANGUAGE'].present?
            return nil unless (request.env['HTTP_ACCEPT_LANGUAGE']).scan(/^[a-z]{2}/).first.present? && I18n.available_locales.include?((request.env['HTTP_ACCEPT_LANGUAGE']).scan(/^[a-z]{2}/).first)
            (request.env['HTTP_ACCEPT_LANGUAGE'] || 'en').scan(/^[a-z]{2}/).first
        end
    end


    def store_current_location
        store_location_for :user, request.original_url
    end


    def set_raven_context
        Raven.user_context(id: current_author.id) if current_author
        Raven.extra_context params: params.to_unsafe_h, url: request.url
    end


end
