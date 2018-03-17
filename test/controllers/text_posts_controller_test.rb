require 'test_helper'

class TextPostsControllerTest < ActionDispatch::IntegrationTest
  test "get new with new post" do
    user1 = users(:user1)

    get new_text_post_url
    text_post = assigns(:text_post)

    assert text_post.new_record?
    assert_response :success
  end

  test "should create post" do
    user = users(:user1)
    post sessions_url, params: { email: user.email, password: "password" }

    post text_posts_url, params: { text_post: { title: "Test Title", body: "Test Body" } }

    text_post = assigns(:text_post)

    assert text_post.persisted?
    assert_redirected_to post_url
  end
end
