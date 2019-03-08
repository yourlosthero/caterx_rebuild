source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# RUBY VERSION 2.3.3
ruby '2.3.3'
# RAILS
gem 'rails', '~> 5.1.6', '>= 5.1.6.1'
# PUMMA APP SERVER
gem 'puma', '~> 3.7'
# SCSS
gem 'sass-rails', '~> 5.0'
# JAVASCRIPT COMPRESSOR
gem 'uglifier', '>= 1.3.0'
# COFFEE SCRIPT FOR ASSETS AND VIEWS
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Omniauth
gem 'omniauth'
# Facebook Omniauth
gem 'omniauth-facebook'
# RESULTS PAGINATION
gem 'will_paginate', '~> 3.1.0'
# Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
gem 'web-console', '>= 3.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # CAPYBARA SYSTEM TESTING
  gem 'capybara', '~> 2.13'
  # SELENIUM DRIVER
  gem 'selenium-webdriver'
  # SQLITE
  gem 'sqlite3', '~> 1.3.6'
  # CARRIERWAVE OFFLINE VERSION
  gem 'carrierwave', '~> 1.0'
end

group :production do
  # POSTGRESQL
  gem 'pg'
  # CARRIERWAVE AWS
  gem 'carrierwave-aws'
  gem 'aws-sdk', '~> 2.3' #Amazon - S3
  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 4.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
