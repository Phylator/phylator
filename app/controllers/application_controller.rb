class ApplicationController < ActionController::Base


    protect_from_forgery with: :exception

    before_action :set_raven_context
    before_action :init
    before_action :set_locale

    before_action :configure_permitted_parameters, if: :devise_controller?



    rescue_from (ActiveRecord::RecordNotFound) { |exception| handle_exception exception, 404 }
    rescue_from (AbstractController::ActionNotFound) { |exception| handle_exception exception, 404 }
    rescue_from (ActionController::RoutingError) { |exception| handle_exception exception, 404 }
    rescue_from (CanCan::AccessDenied) { |exception| handle_exception exception, 403 }
    rescue_from (TSort::Cyclic) { |exception| handle_exception exception, 400 }



    protected



    def configure_permitted_parameters
        devise_parameter_sanitizer.permit :sign_up, keys: [:calculation_id]
        devise_parameter_sanitizer.permit :sign_in, keys: [:calculation_id]
    end

    def after_sign_in_path_for resource
        stored_location_for(resource) || app_root_url
    end



    private



    def init
        @quantities = Quantity.all
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


    def handle_exception ex, status
        render_error ex, status
        logger.error ex
    end
    def render_error ex, status
        respond_to do |format|
            if status == 404
                format.html { render 'errors/not_found', status: status }
            elsif status == 403
                format.html { redirect_back(fallback_location: app_root_url, alert: I18n.t('cd.no_permission')) }
            elsif status == 400
                format.html { redirect_back(fallback_location: app_root_url, alert: I18n.t('calculations.create.error')) }
            end
            format.all { render nothing: true, status: status }
        end
    end


    def set_raven_context
        Raven.user_context id: session[:current_user_id]
        Raven.extra_context params: params.to_unsafe_h, url: request.url
    end


end
