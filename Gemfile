source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "rails", "~> 6.0.0.rc2"
# gem 'rails-i18n'

gem 'pg', '>= 0.18', '< 2.0', ">= 0.18"
gem 'puma', '~> 3.11', "~> 3.11"
# gem 'redis', '~> 4.0'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# gem 'aws-sdk-s3' # for DigitalOcean config

# Auth
gem 'devise'
gem 'devise-i18n'

# Model
gem 'jbuilder', '~> 2.5'
# gem 'aasm'

# View
gem 'sass-rails', '~> 5.0'
gem 'webpacker', '>= 4.0.0.rc.3'
gem 'turbolinks', '~> 5'
# gem 'inline_svg' if using svg files

# CMS
gem 'activeadmin'
gem 'activeadmin_addons'
gem 'arctic_admin'
gem 'arbre', '>= 1.2.1'

# Background
gem 'sidekiq'
gem 'slack-ruby-client'
# gem 'whenever'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Foreman
  gem 'foreman'
  # Hot Reloading
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'guard'
  gem 'guard-zeus'
  gem 'rack-livereload'
  # Debugging
  gem "better_errors"
  gem "binding_of_caller"
  # Test
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  # Mail
  gem "letter_opener"
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
