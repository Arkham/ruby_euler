class Fixnum
  def collatz_cache
    @@collatz_cache ||= []
  end

  def collatz_count
    n = self
    count = 1

    while n > 1
      if collatz_cache[n]
        count += collatz_cache[n] - 1
        break
      end

      if n.even?
        n /= 2
        count += 1
      else
        # odd numbers optimization, since 1->4 3->0 5->6 7->2 9->8
        n = (3*n + 1)/2
        count += 2
      end
    end

    collatz_cache[self] = count
  end
end

max, number = 0, 0

1.upto(1_000_000) do |i|
  current = i.collatz_count
  max, number = current, i if current > max
end

puts "max = #{max}, number = #{number}"
