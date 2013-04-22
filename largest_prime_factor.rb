# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def find_factors(num)
  raise ArgumentError, "num must be >= 0" if num < 0
  return [n] if num <= 1
  result = []

  n = num
  if n.even?
    while n % 2 == 0
      result << 2
      n /= 2
    end
  end

  div = 3

  while (n > 1)
    while n % div == 0
      result << div
      n /= div
    end
    div += 2

    if (div * div > n)
      result << n
      break
    end
  end

  result
end

p find_factors(17)
p find_factors(13195)
p find_factors(600851475143)
