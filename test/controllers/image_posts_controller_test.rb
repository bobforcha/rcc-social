require 'test_helper'

class ImagePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new with new post" do
    user1 = users(:user1)

    get new_image_post_url
    image_post = assigns(:image_post)

    assert image_post.new_record?
    assert_response :success
  end

  test "should create new post" do
    user = users(:user1)
    post sessions_url, params: { email: user.email, password: "password" }

    post image_posts_path, params: { image_post: { title: "Test Image", url: "http://i.imgur.com/Y7syDEa.jpg" } }

    image_post = assigns(:image_post)

    assert image_post.persisted?
    assert_redirected_to post_url(image_post)
  end
end
