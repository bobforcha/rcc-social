require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "redirects anonymous users to login" do
    get :index
    assert_redirected_to  login_url
  end

  test "get index for authorized users" do
    user1 = users(:user1)

    get :index, {}, { user_id: user1.id}
    assert_response :sucess
  end
end
