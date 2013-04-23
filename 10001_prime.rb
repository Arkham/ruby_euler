class Fixnum
  def prime?
    return false if self <= 1
    return true if self == 2
    return false if self.even?

    div = 3
    while (div * div <= self)
      return false if self % div == 0
      div += 2
    end

    return true
  end
end

def find_nth_prime(num)
  raise ArgumentError, "num must be positive" if num <= 0
  return 2 if num == 1
  return 3 if num == 2

  num -= 2
  current = 3

  num.downto(1) do |n|
    current = next_prime(current)
  end
  current
end

def next_prime(prime)
  current = prime + 2
  while !current.prime?
    current += 2
  end
  current
end

1.upto(6) do |n|
  p find_nth_prime(n)
end
p find_nth_prime(10001)
