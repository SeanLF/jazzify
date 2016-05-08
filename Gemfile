source 'https://rubygems.org'

ruby "2.3.0"


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  # This makes an entity relation diagram in PDF format
  gem "rails-erd"
  # Debugging the application
  gem 'byebug'
  # Don't send emails
  gem 'letter_opener'
end

group :development, :test do
  gem 'dotenv-rails', :require => 'dotenv/rails-now'
  gem 'binding_of_caller'
  # More useful error pages
  gem "better_errors"
end

group :production do
  gem 'rails_12factor'
  gem 'sparkpost' # transactional email
  gem 'puma', '>=2.11.1'
end

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
gem 'kaminari'

# reCaptcha by Google
gem "recaptcha", :require => 'recaptcha/rails'
