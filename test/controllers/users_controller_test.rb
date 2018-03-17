require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new with new user" do
    get new_user_url

    user = assigns(:user)

    assert user.new_record?
    assert_response :success
  end

  test "should create user" do


    post users_url, params: {
      user: {
        email: "user@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }

    assert_redirected_to root_url
  end
end
