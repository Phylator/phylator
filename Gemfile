source 'https://rubygems.org'
ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'jquery-rails', '~> 4'
gem 'haml', '~> 5'
gem 'metamagic', '~> 3'
gem 'sentry-raven', '~> 2'
gem 'simple_form', '~> 3'
gem 'i18n', '~> 0'
gem 'globalize', github: 'globalize/globalize'
gem 'ahoy_matey', '~> 1'
gem 'cancancan', '~> 1'
gem 'devise', '~> 4'
# gem 'bcrypt', '~> 3'
gem 'bcrypt', github: 'codahale/bcrypt-ruby', require: 'bcrypt'
gem 'browser', '~> 2'
gem 'friendly_id', '~> 5'
gem 'dentaku', github: 'rubysolo/dentaku'
gem 'pry-rails', '~> 0.3'
gem 'turboboost', github: 'waymondo/turboboost'
gem 'stripe', '~> 3'
gem 'config', '~> 1'
gem 'algoliasearch-rails', '~> 1'
gem 'turbolinks-animate', '~> 1'
gem 'nestive-rails', '~> 1'
gem 'native', '~> 2'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5'
# Use Puma as the app server
gem 'puma', '~> 3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'webpacker', '~> 3'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    # Adds support for Capybara system testing and selenium driver
    gem 'capybara', '~> 2'
    gem 'selenium-webdriver'
end

group :development do
    gem 'web-console', '~> 3'

    # Errors
    gem 'better_errors', '~> 2'
    gem 'binding_of_caller', '~> 0'

    # Security
    gem 'brakeman', '~> 3', require: false

    # Code
    gem 'rubocop', '~> 0', require: false

    # Database
    gem 'mysql2', '~> 0'
    gem 'lol_dba', '~> 2', require: false
end

group :production, :staging do
    gem 'pg', '~> 0'
    gem 'rack-timeout', '~> 0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
