require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user not valid with no params' do
    user = User.new
    user.validate
    assert user.errors.messages.keys.member? :email
  end

  test 'user not valid without password' do
    user = User.new(email: 'bob@bob.com')
    user.validate
    assert user.errors.messages.keys.member? :password
  end

  test 'user valid with email and password' do
    user = User.new(email: 'bob@bob.com', password: 'hello123')
    assert user.validate
  end

  test 'user has default role' do
    user = User.new(email: 'bob@bob.com', password: 'hello123')
    user.save
    assert user.role.id == Role.find_by_name('Registered').id && !user.is_elevated?
  end

  test 'user has default year started' do
    user = User.new(email: 'boba@bob.com', password: 'hello123')
    user.save
    assert user.year_started == DateTime.now.year
  end
end
