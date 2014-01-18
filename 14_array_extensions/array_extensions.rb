module MathArray
  
  def sum
    reduce(:+) or 0
  end

  def square
    map { |n| n ** 2 }
  end

  def square!
    map! { |n| n ** 2 }
  end
end

class Array
  include MathArray
end
