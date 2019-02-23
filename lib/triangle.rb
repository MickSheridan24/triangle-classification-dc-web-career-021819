class Triangle
  # write code here
  attr_accessor :kind, :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1, @s2, @s3 = s1, s2, s3
  end

  def kind
    if (!legal?(s1, s2, s3))
      puts "ILLEGAL!!!"
      raise TriangleError
      begin
      rescue TriangleError => error
        puts error.message
      end
    else
      if (s1 == s2 && s2 == s3)
        @kind = :equilateral
      elsif (isosceles?(s1, s2, s3))
        @kind = :isosceles
      else
        @kind = :scalene
      end
    end
  end

  def legal?(s1, s2, s3)
    con1 = (s1 > 0 || s2 > 0 || s3 > 0)
    list = [s1, s2, s3].sort do |l, h|
      l <=> h
    end
    con2 = (list[0] + list[1] > list[2])

    return (con1 && con2)
  end

  def isosceles?(s1, s2, s3)
    con1 = (s1 == s2 && s1 != s3)
    con2 = (s1 == s3 && s1 != s2)
    con3 = (s2 == s3 && s2 != s1)
    return (con1 || con2 || con3)
  end

  class TriangleError < StandardError
    def initialize
    end

    def message
      "Triangle must have proper sides"
    end
  end
end
