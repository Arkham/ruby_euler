def sum_squares(n)
  (n * (n + 1) * (2*n + 1)) / 6
end

def square_sum(n)
  sum = (n * (n+1)) / 2
  sum * sum
end

def print_diff(n)
  puts square_sum(n), sum_squares(n), square_sum(n) - sum_squares(n), "\n"
end

print_diff(10)
print_diff(100)
