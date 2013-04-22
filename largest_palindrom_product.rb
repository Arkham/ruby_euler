# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome(n)
  string = n.to_s
  string == string.reverse
end

# (0..100).each do |n|
#   puts("#{n} palindrome? #{is_palindrome(n)}")
# end

def largest_palindrom(digits)
  upper_limit = (10 ** digits) - 1
  lower_limit = 10 ** (digits - 1)

  max = 0
  result = [false, false]

  first = upper_limit

  while first >= lower_limit
    second = upper_limit
    while second >= lower_limit
      current = first * second
      if is_palindrome(current) && current > max
        max = current
        result = [first, second]
      end
      second -= 1
    end
    first -= 1

    break if first * first < max
  end

  return result
end

p largest_palindrom(3)
