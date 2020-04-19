require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "no_save_without_username" do
    comment = Comment.new
    assert_not comment.save, "Comment saved without user"
  end
  fixtures :comments
  def test_post
    ansh= Comment.new :username => comments(:one).username, :body => comments(:one).body, :post => comments(:one).post
    assert ansh.save, "first var not saved"
    ansh1 = Comment.find(ansh.id)
    assert_equal ansh.id, ansh1.id, "difference in copies"
    nina = Comment.new :username => comments(:two).username, :body => comments(:two).body, :post => comments(:two).post
    nina.username= "nina_dk"
    assert nina.save, "second var not saved"
    assert nina.destroy, "variable not deleted"
  end 
end
