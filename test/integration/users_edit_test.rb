require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:bob)
  end

  test "unsuccessful edit" do
  	get edit_user_path(@user)
  	assert_template 'users/edit'
  	patch user_path(@user), params:{ 
  		user: {
	  		name: "",
	  		email: "foo@invalid",
	  		password: "foo",
	  		password_confirmation: "bar"
  		}
  	}

  	assert_template 'users/edit'
  	assert_select "div#error_explanation li", count: 4
  end
end
