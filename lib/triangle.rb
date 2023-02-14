class Triangle
  # write code here

  attr_accessor :base, :height, :hypotenuse, :type

  def initialize (base, height, hypotenuse)
    @base = base
    @height = height
    @hypotenuse = hypotenuse
  end

  def kind
    if ((base <=0) || (height <=0 ) || (hypotenuse <=0))
      begin 
        raise TriangleError
      end
      puts error.message
    else
      if (base + height <=  hypotenuse || base + hypotenuse <= height || height + hypotenuse <= base)
        begin 
          raise TriangleError, "Does not satisfy triangle inequality"
        end
      else
        if ((base == height) & (height == hypotenuse) & (base == hypotenuse))
          @@type = :equilateral
        elsif ((base == height) || (height == hypotenuse) || (base == hypotenuse))
          @@type = :isosceles
        elsif ((base != height) & (height!= hypotenuse) & (base != hypotenuse))
          @@type = :scalene
        end
      end
    end
  end

  class TriangleError < StandardError
    def message
      "TriangleError"
    end
  end

end

# puts Triangle.new(2, 2, 2).kind
# puts Triangle.new(3, 4, 4).kind
# puts Triangle.new(3, 4, 5).kind
# puts Triangle.new(0, 0, 0).kind
# puts Triangle.new(2, 4, 2).kind