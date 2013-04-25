class Fixnum

  def number_table
    [
      "",
      "one",
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine",
      "ten",
      "evelen",
      "twelve",
      "thirteen",
      "fourteen",
      "fifteen",
      "sixteen",
      "seventeen",
      "eighteen",
      "nineteen"
    ]
  end

  def ten_table
    [
      false,
      false,
      "twenty",
      "thirty",
      "forty",
      "fifty",
      "sixty",
      "seventy",
      "eighty",
      "ninety"
    ]
  end

  def letter_table(num, digits, no_following)
    if digits == 1
      result = ten_table[num]
      no_following ? result : "#{result}-"
    elsif digits == 2
      result = "#{number_table[num]} hundred"
      no_following ? result : "#{result} and "
    elsif digits == 3
      result = "#{number_table[num]} thousand"
      no_following ? result : "#{result} and "
    end
  end

  def to_letters
    n, result = self, ''
    digits = Math.log10(self).floor

    while digits >= 0
      if (n < 20)
        result << number_table[n]
        break
      end

      div = 10 ** digits
      current = n / div
      n = n % div

      result << letter_table(current, digits, n.zero?)
      digits -= 1
    end

    result
  end
end

result = (1..1000).inject(0) do |total, n|
  p letters = n.to_letters
  total + letters.gsub(/[ -]/, '').length
end
p result
