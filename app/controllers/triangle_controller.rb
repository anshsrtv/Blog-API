class TriangleController < ApplicationController

    def new
    end

    def create
        @triangle = Triangle.new(params.require(:triangle).permit(:a, :b, :c))
        if  @triangle.a == @triangle.b &&  @triangle.c == @triangle.b
            @triangle.type = 'Equilateral'
        elsif  @triangle.a == @triangle.b || @triangle.b == @triangle.c || @triangle.a == @triangle.c
            @triangle.type = 'Isosceles'
        else
            @triangle.type = 'Scalene'
        end
    end
end
