require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "compass", email:"compass@example.com",
  		password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = " "
  	assert_not @user.valid?
  end

  test "name validation should reject length over 50" do
  	@user.name = "a" * 51
  	assert_not @user.valid?
  end




end
