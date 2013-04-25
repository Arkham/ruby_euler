class Fixnum
  def power_of_two
    2 ** self
  end
end

class String
  def digit_sum
    self.chars.inject(0) do |total, c|
      total + c.to_i
    end
  end
end

p 1000.power_of_two.to_s.digit_sum
