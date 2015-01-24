require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user cannot have same email" do
  	one = User.new
  	one.email = "bob12345@bob.com"
  	one.password = "1234567890"
  	one.password_confirmation = "1234567890"
  	one.encrypted_password = "1234567890"
  	one.save!
  	two = User.new
  	two.email = "bob12345@bob.com"
  	two.password = "1234567890"
  	two.password_confirmation = "1234567890"
  	assert_not two.save
	end

	test "should not create user with less than 8 characters for password" do
		test = User.new
		test.email = "test@bob.com"
		test.password = "312867"
		test.password_confirmation = "312867"
		assert_not test.save
	end

end
