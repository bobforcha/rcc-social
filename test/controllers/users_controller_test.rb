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

  test "should show user" do
    user = users(:user1)

    get user_url(user)
    assert assigns(:user)
    assert_response :success
  end

  test "should follow user" do
    user1 = users(:user1)
    user2 = users(:user2)
    post sessions_url, params: { email: user1.email, password: "password" }

    get follow_user_url(user2.id)
    assert user1.following? user2
    assert_redirected_to user_url(user2)
  end
end
