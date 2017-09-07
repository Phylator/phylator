Rails.application.config.filter_parameters << :password

Raven.configure do |config|
    config.dsn = 'https://0efff54097da44aeb91bf4940bc92725:90b6c1f07aa24b1388e66305a9d11efb@sentry.io/214094'
    config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
