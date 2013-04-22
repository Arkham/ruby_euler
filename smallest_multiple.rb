class Fixnum
  def factors
    return [] if self == 0
    result = []
    n = self

    if n.even?
      while n.even?
        result << 2
        n /= 2
      end
    end

    div = 3

    while n > 1
      while n % div == 0
        result << div
        n /= div
      end

      div += 2
    end

    result
  end
end

class Array
  def hash_count
    self.each_with_object({}) do |elem, hash|
      hash[elem] ||= 0
      hash[elem] += 1
    end
  end
end

def smallest_multiple(first, last)
  result = {}
  first.upto(last) do |n|
    n.factors.hash_count.each do |value, count|
      result[value] ||= 0
      result[value] = count if result[value] < count
    end
  end

  result.inject(1) do |total, (value, count)|
    count.times { total *= value }
    total
  end
end

p smallest_multiple(1, 10)
p smallest_multiple(1, 20)
