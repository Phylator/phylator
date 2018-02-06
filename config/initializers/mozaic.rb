Mozaic.configure do |config|

    # Define Mozaic components
    config.define_component 'layouts/google_analytics', tracking_id: Settings.google_analytics.tracking_id

end
