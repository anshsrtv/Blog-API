require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "no_save_without_title" do
    post = Post.new
    assert_not post.save, "Post saved without title"
  end
  fixtures :posts
  def test_post
    rails= Post.new :title => posts(:one).title, :body => posts(:one).body
    assert rails.save
    rails1 = Post.find(rails.id)
    assert_equal rails.id, rails1.id
    sc = Post.new :title => posts(:two).title, :body => posts(:two).body
    sc.title = "SportsCompass_dk"
    assert sc.save
    assert sc.destroy
  end 
end
