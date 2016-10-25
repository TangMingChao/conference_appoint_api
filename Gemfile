#source 'https://rubygems.org'
source 'https://gems.ruby-china.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# Read more:https://github.com/cyu/rack-cors
gem 'rack-cors'

###############################################################################
# Automatically generate API documentation from RSpec, Read more: https://github.com/zipmark/rspec_api_documentation
# $ mkdir spec/acceptance
# $ vim spec/acceptance/xx_spec.rb
gem 'rspec_api_documentation'
# A set of Rails responders to dry up your application, Read more: https://github.com/plataformatec/responders
gem "responders"
# Flexible authentication solution for Rails with Warden. Read more: https://github.com/plataformatec/devise
gem 'devise'
# Annotate Rails classes with schema and routes info, Read more: https://github.com/ctran/annotate_models
gem 'annotate' 
# Simple (but safe) token authentication for Rails apps or API with Devise. Read more: https://github.com/gonzalo-bulnes/simple_token_authentication
gem 'simple_token_authentication', '~> 1.0'
# An API documentation reader for RSpec API Documentation. Read more: https://github.com/jejacks0n/apitome
#rails generate apitome:install
gem "apitome"
# # Easy file attachment management for ActiveRecord
# # Read more: https://github.com/thoughtbot/paperclip
# # First install: sudo apt-get install imagemagick -y
# gem "paperclip", "~> 5.0.0"

# Pagination library for Rails, Sinatra, Merb, DataMapper, and more
# Read more: https://github.com/mislav/will_paginate
gem 'will_paginate', '~> 3.1.0'
# i18n relate gems
# Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff http://rails-i18n.org
# Read more: https://github.com/svenfuchs/rails-i18n
gem 'rails-i18n', '~> 5.0.0'
# Translations for the devise gem
# Read more: https://github.com/tigrish/devise-i18n
gem 'devise-i18n'
 # AASM - State machines for Ruby classes (plain Ruby, ActiveRecord, Mongoid, MongoMapper)
   # Read more: https://github.com/aasm/aasm
gem 'aasm'

###############################################################################

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  ####################################################################
  # rspec-rails is a testing framework for Rails 3.x, 4.x and 5.0. Read more: https://github.com/rspec/rspec-rails
  # rails generate rspec:install
  gem 'rspec-rails', '~> 3.5'
  # Collection of testing matchers extracted from Shoulda, Read more: https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 3.1'
  # factory_girl is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies 
  # (saved instances, unsaved instances, attribute hashes, and stubbed objects), and support for multiple factories for the same class 
  # (user, admin_user, and so on), including factory inheritance.
  # Read more: https://github.com/thoughtbot/factory_girl_rails
  gem 'factory_girl_rails'
 
  ####################################################################
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
