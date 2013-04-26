result = (Date.parse("01/01/1901")..Date.parse("31/12/2000")).inject(0) do |total, date|
  date.sunday? && date.day == 1 ? total + 1 : total
end

p result
