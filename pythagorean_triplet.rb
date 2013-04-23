def find_pythagorean(limit)
  limit.downto(1) do |a|
    limit.downto(a) do |b|
      c = limit - a - b
      if pythagorean?(a, b, c)
        return a, b, c
      end
    end
  end
end

def pythagorean?(a, b, c)
  a**2 + b**2 == c**2
end

result = find_pythagorean(1000)
p result
p result.inject(:*)
