limit = 4000000

@fib_cache = {}

def fib(n)
  return 1 if (n == 0 || n == 1)
  @fib_cache[n] ||= fib(n-1) + fib(n-2)
end

# first solution

total = n = 0

while (current = fib(n)) < limit
  total += current if current % 2 == 0
  n += 1
end

puts total

# second solution

# (0..10).each do |n|
#   puts fib n
# end

# 1 1 2 3 5 8 13 21 34 55 89
#     ^     ^       ^
# one every third is even

# formula is current = current * 4 + previous

total = previous = 0
current = 2

def next_even(current, previous)
  return (current * 4 + previous), current
end

while current < limit
  total += current
  current, previous = next_even(current, previous)
end

puts total
