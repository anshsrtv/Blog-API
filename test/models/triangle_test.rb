require 'test_helper'

class TriangleTest < ActiveSupport::TestCase
  fixtures :triangles
  def test_triangle
    triangle1= Triangle.new :a => triangles(:one).a, :b => triangles(:one).b, :c => triangles(:one).c
    triangle1.save
    triangle2= Triangle.find(triangle1.id)
    triangle2.save
    assert_equal triangle1.a, triangle2.a, "Copies not equal"
    triangle1.a = 4
    assert_not_equal triangle1.a, triangle2.a
  end
end
