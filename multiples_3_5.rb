limit = 1000

result = (1...limit).select {|n|
  (n % 3).zero? or (n % 5).zero?
}.inject(:+)
puts result

def find_multiples(limit, n)
  current, result = n, 0

  while (current < limit)
    result += current
    current += n
  end

  result
end

result = find_multiples(limit, 5) + find_multiples(limit, 3) - find_multiples(limit, 15)
puts result
