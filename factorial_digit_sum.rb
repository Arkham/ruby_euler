class Fixnum
  def factorial
    (1..self).inject(:*)
  end
end

class String
  def digit_sum
    self.chars.inject(0) do |total, c|
      total + c.to_i
    end
  end
end

p 100.factorial.to_s.digit_sum
