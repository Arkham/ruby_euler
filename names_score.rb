class NameScore
  attr_reader :names

  def initialize(filename)
    @names = File.read(filename).scan(/[A-Z]+/).sort
  end

  def total_score
    names.each_with_index.inject(0) do |total, (name, i)|
      total + name.chars_score * (i+1)
    end
  end
end

class String
  A_ORD = 'A'.ord

  def chars_score
    self.chars.inject(0) do |total, c|
      total + c.ord - A_ORD + 1
    end
  end
end

p NameScore.new('names.txt').total_score
