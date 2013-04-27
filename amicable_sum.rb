class Fixnum
  def lower_factors
    return [] if self <= 0
    return [1] if self == 1

    result = [1]
    n, div = self, 2

    while n >= div * div
      if n % div == 0
        result << div
        remainder = n/div
        result << remainder unless div == remainder
      end
      div += 1
    end

    result
  end
end

class Amicable
  attr_reader :limit, :numbers

  def initialize(limit)
    @numbers = []
    @limit = limit
    build_factors!
  end

  def build_factors!
    1.upto(limit) do |n|
      @numbers[n] = n.lower_factors.inject(:+)
    end
  end

  def find_sum
    (1..limit).inject(0) do |total, i|
      sum = numbers[i]
      if sum != i && numbers[sum] == i
        total + i
      else
        total
      end
    end
  end
end

p Amicable.new(10000).find_sum
