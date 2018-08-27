# frozen_string_literal: true

environment = Rails.env.production? ? :production : :development

Raven.configure do |config|
  config.dsn =
    Rails.application.credentials.dig(environment, :sentry_raven, :dsn)
  config.sanitize_fields =
    Rails.application.config.filter_parameters.map(&:to_s)
end
