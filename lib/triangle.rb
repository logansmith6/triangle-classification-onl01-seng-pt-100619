require 'pry'
class Triangle
  # write code here
  attr_accessor :length_one, :length_two, :length_three
  #attr_writer :equilateral, :isosceles, :scalene

  def initialize(length_one, length_two, length_three)
    @length_one = length_one
    @length_two = length_two
    @length_three = length_three
  end

  attr_accessor :equilateral, :scalene, :isosceles


  def valid_triangle
    x = length_one + length_two
    y = length_one + length_three
    z = length_three + length_two

    if length_one <=0 || length_two <= 0 || length_three <= 0
      false
    elsif (x <= length_three) || (y <= length_two) || (z <= length_one)
      false
    else
      true
    end
  end

  def equil
    if length_one == length_two && length_one == length_three
      true
    else
      false
    end
  end

  def isosc
    if equil == false && (length_one == length_two || length_one == length_three || length_three == length_two)
      true
    else
      false
    end
  end



  def kind

    if valid_triangle == false
      begin
        raise TriangleError

      end
    else
      if equil == true
        "equilateral".to_sym
      elsif isosc == true
        "isosceles".to_sym
      else
        "scalene".to_sym
      end
    end

  end

  class TriangleError < StandardError
    def message
      "invalid triangle dimensions"
    end
  end

end
