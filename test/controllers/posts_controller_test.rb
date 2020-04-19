require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def test_index
    get posts_url
    assert_response :success
  end

  def test_show
    new_post = posts(:one)
    get post_url :id => new_post.id
    assert_response :success
  end

  def test_new
    get new_post_url
    assert_response :success
  end
  
  def test_edit
    post = posts(:one)
    get edit_post_url :id => post.id
    assert_response :success
  end

  def test_create
    post posts_url :params=> { post: { title: "Post Created", body: "Successfully" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Title:\n  Post Created"
  end

  def test_destroy
    post = posts(:one)
    post.save
    delete post_url :id => post.id
    assert_redirected_to posts_path, "delete failed"
  end

end
