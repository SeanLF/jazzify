require 'test_helper'

class UserInformationTest < ActiveSupport::TestCase
  test 'detects invalid postal code' do
    info = UserInformation.new(postal_code: '90024')
    info.validate
    assert info.errors.messages.member?(:postal_code)
  end

  test 'allows valid postal code' do
    info = UserInformation.new(postal_code: 'K1N1A1')
    info.validate
    assert_not info.errors.messages.member?(:postal_code)
  end

  test 'detects invalid phone number' do
    info = UserInformation.new(home_phone_number: '1139026543')
    info.validate
    assert info.errors.messages.member?(:home_phone_number)
  end

  test 'allows valid phone number' do
    info = UserInformation.new(home_phone_number: '6139026543')
    info.validate
    assert_not info.errors.messages.member?(:home_phone_number)
  end

  test 'detects absence of any phone number' do
    info = UserInformation.new
    info.validate
    assert info.errors.messages[:base].member?('Please enter at least one phone number.')
  end

  test 'detects invalid t-shirt size' do
    info = UserInformation.new(t_shirt_size: 'incorrect')
    info.validate
    assert info.errors.messages.member?(:t_shirt_size)
  end
  
end
