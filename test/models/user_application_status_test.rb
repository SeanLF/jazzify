require 'test_helper'

class UserApplicationStatusTest < ActiveSupport::TestCase
  test 'status accepted exists' do
    assert UserApplicationStatus.find_by(status: 'Accepted')
  end

  test 'status denied exists' do
    assert UserApplicationStatus.find_by(status: 'Denied')
  end

  test 'status pending exists' do
    assert UserApplicationStatus.find_by(status: 'Pending')
  end
end
