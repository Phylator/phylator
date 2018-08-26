# frozen_string_literal: true

Mozaic.configure do |config|
  # Use Mozaic with Webpacker
  # config.es6 = true
  # Javascript asset directory
  config.javascripts = 'app/webpack/javascripts'
  # Stylesheet asset directory
  config.stylesheets = 'app/webpack/stylesheets'

  # Define Mozaic components
  config.define_component 'desktop'
  config.define_component 'suggestion'
  config.define_component 'layouts/google_analytics', tracking_id: Settings.google_analytics.tracking_id
end
