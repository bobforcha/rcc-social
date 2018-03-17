require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test "user login, browse, and logout" do
    @user = users(:user1)

    get "/login"
    assert_response :success

    post sessions_url, params: { email: @user.email, password: "password" }
    get root_url
    assert_equal "/", path

    get "/logout"
    assert_response :redirect
    follow_redirect!
    assert_response :redirect
    follow_redirect!
    assert_equal "/login", path
  end
end
