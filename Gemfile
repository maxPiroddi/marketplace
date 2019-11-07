# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Styling & Responsiveness
gem 'bootstrap-sass', '~> 3.4.1'
gem 'sassc-rails', '>= 2.1.0'

# User/Auth. management
gem 'devise', '~> 4.7'

# Beautiful & easy forms, well implemented w. Devise & Bootstrap
gem 'simple_form', '~> 5.0'

# Payment gateway
gem 'stripe', '~> 5.7'

# Data generation for Seeds file
gem 'faker', '~> 2.6'

gem 'rack-cors', '~> 1.0'

# AWS required
gem 'aws-sdk-s3', '~> 1.52'

# Use .env file to store AWS/S3 credentials
gem 'dotenv-rails', '~> 2.7'

# Download images for Seed file
gem 'down', '~> 5.0'

# Used to manually hit AusPost API w/ GET request
gem 'http', '~> 4.2'

# Webhooks for stripe
gem 'ultrahook', '~> 0.1.5'

# Pagination of Index page
gem 'kaminari', '~> 1.1'
