require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "redirects anonymous users to login" do
    get posts_url
    assert_redirected_to  login_url
  end

  test "get index for authorized users" do
    @user1 = users(:user1)
    post sessions_url, params: { email: @user1.email, password: 'password' }

    get posts_url
    assert_response :success
  end
end
