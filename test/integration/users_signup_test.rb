require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # 新規登録が上手く行かない時にちゃんとリダイレクトされるかどうかのテスト
  test "invalid signup information" do
  	get signup_path
  	# assert_no_differenceのブロックを実行する前後で引数の値 (User.count) が変わらないことをテストしています
  	assert_no_difference 'User.count' do
  		post users_path, params: {user:{name: "",
  								email: "user@invalid",
  								password: "foo",
  								password_confirmation: "bar" } }
  	end
  	assert_template 'users/new'
  	assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  # 新規登録が上手くいった時のテスト
  test "valid signup information" do
  	get signup_path
  	assert_difference "User.count", 1 do
  		post users_path, params: {user:{name: "Example User",
  								email: "user@example.com",
  								password: "password",
  								password_confirmation: "password" } }
  	end
  	# follow_redirect!メソッドは、POSTリクエストを送信した結果を見て、指定されたリダイレクト先に移動するメソッド
  	follow_redirect!
  	assert_template root_path
  	# flashが空でないかをテスト (flashがあったらtrue)
  	assert_not flash.nil?
    assert is_logged_in?
  end
end
