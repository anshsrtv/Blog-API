require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def test_create
    post = posts(:two)
    post.save
    post post_comments_url(post.id), :params=> { comment: { username: "Comment Created", body: "Successfully", post: post } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  def test_edit
    post = posts(:two)
    comment = comments(:two)
    post.save
    comment.save
    get edit_post_comment_url(post.id,comment.id)
    assert_response :success
    assert_select "h1", "Edit Comment"
  end

  def test_update
    post = posts(:two)
    comment = comments(:two)
    post.save
    comment.save
    patch post_comment_url(post.id,comment.id), :params=> { comment: { username: "Comment Updated", body: "Successfully", post: post } }
    assert_redirected_to post_path(post.id), "Update failed"
  end
  def test_destroy
    post = posts(:two)
    comment = comments(:two)
    post.save
    comment.save
    delete post_comment_url(post.id,comment.id)
    assert_redirected_to post_path(post.id), "delete failed"
  end
end

