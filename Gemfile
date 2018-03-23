source 'https://rubygems.org'
ruby '2.3.3'

git_source(:github) do |repo_name|
    repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
    "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.2.0.rc2'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'turbolinks'
gem 'jbuilder'
gem 'redis'
gem 'haml'
gem 'metamagic'
gem 'search-engine-optimization'
gem 'sentry-raven'
gem 'simple_form'
gem 'i18n'
gem 'ahoy_matey'
gem 'cancancan'
gem 'devise'
# gem 'bcrypt'
gem 'bcrypt', github: 'codahale/bcrypt-ruby', require: 'bcrypt'
gem 'config'
gem 'mailgun-ruby'
gem 'stripe'
gem 'friendly_id'
gem 'turbolinks-animate'
gem 'nativegap'
gem 'webpacker'
gem 'r404'
gem 'acts_as_belongable'
gem 'randomize_id'
gem 'cancancan-system'
gem 'mozaic'
gem 'myg'
gem 'nilify_blanks'
gem 'modalist'
gem 'browser'
gem 'dentaku'
gem 'algoliasearch-rails'
gem 'bootsnap', require: false


group :development, :test do
    gem 'byebug'
    gem 'capybara'
    gem 'selenium-webdriver'
end

group :development do
    gem 'certified'
    gem 'web-console'
    gem 'pry-rails'
    gem 'better_errors'
    gem 'binding_of_caller'
    gem 'brakeman', require: false
    gem 'rubocop', require: false
    gem 'mysql2', '~> 0.4.10'
    gem 'lol_dba', require: false
end

group :production do
    gem 'pg'
    gem 'rack-timeout'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
