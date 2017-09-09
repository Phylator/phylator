class ApplicationController < ActionController::Base


    protect_from_forgery with: :exception

    before_action :set_raven_context
    before_action :init
    before_action :set_locale



    private



    def init
        @quantities = Quantity.all
        @units_of_measurement = UnitOfMeasurement.all
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
        location = current_visit.location
        return nil unless location.present? && location.country_code.present? && I18n.available_locales.include?(location.country_code)
        location.country_code.include?("-") ? location.country_code : location.country_code.downcase
    end
    def header_detected_locale
        if request.env['HTTP_ACCEPT_LANGUAGE'].present?
            return nil unless (request.env['HTTP_ACCEPT_LANGUAGE']).scan(/^[a-z]{2}/).first.present? && I18n.available_locales.include?((request.env['HTTP_ACCEPT_LANGUAGE']).scan(/^[a-z]{2}/).first)
            (request.env['HTTP_ACCEPT_LANGUAGE'] || 'en').scan(/^[a-z]{2}/).first
        end
    end


    def set_raven_context
        Raven.user_context id: session[:current_user_id]
        Raven.extra_context params: params.to_unsafe_h, url: request.url
    end


end
