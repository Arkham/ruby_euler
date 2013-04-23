# class Fixnum
#   def prime?
#     return false if self <= 1
#     return true if self <= 3
#     return false if self.even?
#     return false if self % 3 == 0

#     div = 5
#     while div*div <= self
#       if self % div == 0 || self % (div+2) == 0
#         return false
#       end
#       div += 6
#     end

#     true
#   end
# end

# def old_summation_of_primes(limit)
#   1.upto(limit).inject(0) do |total, n|
#     puts n if n % 10000 == 0
#     if n.prime?
#       total + n
#     else
#       total
#     end
#   end
# end

class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def sieve
    @sieve ||= (0..limit).to_a.tap do |array|
      array[0] = false
      array[1] = false
    end
  end

  def cross_limit
    @cross_limit ||= Math.sqrt(limit)
  end

  def sum_of_primes
    return 0 if limit <= 1

    3.upto(cross_limit) do |n|
      if sieve[n]
        # we have a prime number
        start = n*n
        # start from n*n (previous products are already multiples)
        # use 2*n as step to exclude even multiples
        start.step(limit, 2*n) do |m|
          sieve[m] = false
        end
      end
    end

    total = 2
    3.step(limit, 2) do |n|
      if sieve[n]
        total += n
      end
    end
    total
  end
end

p Sieve.new(2_000_000).sum_of_primes
