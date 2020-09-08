# def word_cap(string)
#   array = string.split.map do |word|
#     word.capitalize
#   end

#   array.join(" ")
# end


# p word_cap('four score and seven')
# p word_cap('this is a "quoted" word')

# require "date"

# def friday_13th?(year)
#   # Stackoverflow help
#   # count = 0
#   # (Date.new(year, 01, 01)..Date.new(year, 12, 30)).each do |date|
#   #   count += 1 if date.friday? && date.day == 13
#   # end
#   # count

#   count = 0

#   (1..12).each do |month|
#     count += 1 if Date.new(year, month, 13).friday?
#   end  

#   count
# end

# p friday_13th?(2015)
# p friday_13th?(1986) 


# 2
NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(num_of_operations)
  new_string = NUMBERS.sample

  num_of_operations.times do
    new_string += " #{OPERATORS.sample} #{NUMBERS.sample}"
  end

  new_string.gsub('divided', 'divided by')
end

# p mathphrase(1)
# p mathphrase(2)
# p mathphrase(3)

# 3
10.times do |_|
  length = (1..20).to_a.sample.to_i
  p mathphrase(length)
end




