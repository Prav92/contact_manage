require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count', 1 do
      post users_path, user: { name:  "Sankar",
                               email: "cc@cc.com",
                               password:              "qqqqqqq",
                               password_confirmation: "qqqqqqq" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
