  ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  puts "Load seed data"
  load "#{Rails.root}/db/seeds.rb"
end
class ActionController::TestCase
  include Devise::TestHelpers
end
