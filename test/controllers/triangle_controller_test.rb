require 'test_helper'

class TriangleControllerTest < ActionDispatch::IntegrationTest
   
  def test_new
    get triangle_url
    assert_response :success
    assert_select "p", "A"
  end

  def test_create
    post triangle_url :params => { triangle: { a: 1.5, b: 1.5, c: 1.5}}
    assert_response :success
    assert_select "h1", "Triangle type: Equilateral"
    post triangle_url :params => { triangle: { a: 1.5, b: 2.5, c: 3.5}}
    assert_select "h1", "Triangle type: Scalene"
    post triangle_url :params => { triangle: { a: 1.5, b: 1.5, c: 4.5}}
    assert_select "h1", "Triangle type: Isosceles"
  end
  
end
