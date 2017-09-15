require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Phylator
    class Application < Rails::Application
        # Initialize configuration defaults for originally generated Rails version.
        config.load_defaults 5.1

        # Settings in config/environments/* take precedence over those specified here.
        # Application configuration should go into files in config/initializers
        # -- all .rb files in that directory are automatically loaded.

        config.to_prepare do
            Devise::RegistrationsController.layout proc { |controller| action_name == 'edit' ? 'app' : 'application' }
        end

        config.action_dispatch.default_headers = {
            'X-Frame-Options' => 'ALLOWALL'
        }

    end
end
