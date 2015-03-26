source 'https://rubygems.org'

ruby "2.2.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 4.1.8'

# Use postgre SQL as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 3.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Font awesome
gem 'font-awesome-sass'

# Authentication
gem 'devise'
# Two factor
gem 'devise-two-factor'
gem 'rqrcode-rails3'

# Autoprefixer
gem 'autoprefixer-rails'

# Bootstrap oriented gems
gem 'bootstrap-sass', '>= 3.3.3'
gem 'bootstrap-generators'
gem 'devise-bootstrap-views'
gem 'sprockets-rails'

# Creating excel reports
gem 'axlsx'

# Authorization
gem 'pundit'

# Admin panel
gem 'upmin-admin'

# Pagination
gem 'will_paginate', '>= 3.0.6'
gem 'will_paginate-bootstrap'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  # This makes an entity relation diagram in PDF format
  gem "rails-erd"
  # Debugging the application
  gem 'byebug'
  # To help debugging
  gem 'did_you_mean'
  # For testing
  gem 'rspec-rails', '>=3.2.0'
  gem 'puma'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end
