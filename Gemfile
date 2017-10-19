source 'https://rubygems.org'
ruby '2.4.1'

gem 'simple_form'
# gem 'administrate-field-json', github: 'eddietejeda/administrate-field-json', branch: 'master'
# gem 'administrate'
# gem 'administrate-field-enum'
# gem 'administrate-field-image'
# gem 'administrate-field-json'
# gem 'administrate-field-refile'
# gem 'administrate-field-telephone'
# gem 'administrate-field-time'
gem 'bootstrap'
gem 'jquery-rails'
gem 'autoprefixer-rails'
gem 'sprockets-rails'
gem 'bourbon'
gem 'oj'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'pusher'
gem 'refile', require: 'refile/rails', github: 'refile/refile', branch: 'master'
gem 'refile-mini_magick'
gem 'refile-s3'
gem 'rollbar'
gem 'sinatra', github: 'sinatra/sinatra', branch: 'master'
gem "omniauth"
gem "omniauth-google-oauth2"
gem 'foundation-rails'

group :production do
  gem 'sidekiq'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.2'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'mqtt', :git => 'https://github.com/njh/ruby-mqtt.git'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'railroady'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '~> 3.0.5'
  gem 'meta_request'
  gem 'rubocop'
  gem 'scss_lint', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
