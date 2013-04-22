@fib_cache = {}

def fib(n)
  return 1 if (n == 0 || n == 1)
  @fib_cache[n] ||= fib(n-1) + fib(n-2)
end

limit = 4000000
total = n = 0

while (current = fib(n)) < limit
  total += current if current % 2 == 0
  n += 1
end

puts total
