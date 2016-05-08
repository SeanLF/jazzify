require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test 'default_role_exists' do
    assert_not Role.find_by_name('Registered').nil?
  end

  test 'admin role exists' do
    assert_not Role.find_by_name('Admin').nil?
  end

  test 'moderator role exists' do
    assert_not Role.find_by_name('Moderator').nil?
  end
end
