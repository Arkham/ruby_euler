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

UpperLimit = 28123

class Abundant
  def self.all
    result = {}
    (1..UpperLimit).each do |n|
      sum = n.lower_factors.inject(:+)
      result[n] = true if sum > n
    end
    result
  end
end

class AbundantSieve
  attr_reader :sieve, :abundant
  def initialize
    @sieve = []
    @abundant = Abundant.all
  end

  def mark_abundant_sums!
    abundant_keys = abundant.keys

    (1..UpperLimit).each do |n|
      abundant_keys.each do |key|
        break if key > n

        if abundant[n-key]
          sieve[n] = true
          break
        end
      end
    end
  end

  def get_non_abundant_sum
    (1..UpperLimit).inject(0) do |total, n|
      total + (sieve[n] ? 0 : n)
    end
  end

end

as = AbundantSieve.new
as.mark_abundant_sums!
p as.get_non_abundant_sum
