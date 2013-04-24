require 'set'

class Fixnum

  def triangle
    (self * (self+1)) / 2
  end

  def prime_factors
    n = self
    result = []

    while n % 2 == 0
      result << 2
      n /= 2
    end

    div = 3
    while div <= n
      while n % div == 0
        result << div
        n /= div
      end
      div += 2
    end

    result.to_a
  end

  def factors_count
    hash = prime_factors.each_with_object({}) do |elem, hash|
      hash[elem] ||= 0
      hash[elem] += 1
    end

    hash.inject(1) do |total, (factor, count)|
      total * (count + 1)
    end
  end
end

(1..10).each do |n|
  p "#{n.triangle} -> #{n.triangle.factors_count}"
end

(1..Float::INFINITY).each do |n|
  puts "~ #{n}" if n % 1000 == 0

  if n.triangle.factors_count > 500
    puts n.triangle
    break
  end
end
