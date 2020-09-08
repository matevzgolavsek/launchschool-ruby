# VOWELS = 'aeiou'
# words = ['green', 'yellow', 'black', 'white']

# def remove_vowels(string_array)
#   string_array.map do |string|
#     string.delete(VOWELS)
#   end

#   # string_array.each do |word|
#   #   # puts word.include?(VOWELS)
#   #   word_array = word.split('')
#   #   word_no_vowels = word_array.select { |char|
#   #     !VOWELS.include?(char)
#   #   }

#   #   word_no_vowels.join('')
#   # end
# end

# p remove_vowels(words)

# balancer("hi") # => true
# balancer("(hi") # => false
# balancer("(hi)") # => true

# def balancer(string)
#   #my solution
#   # string_array = string.split("")

#   # count_array = string_array.select do 
#   #   |char|

#   #   ('()').include?(char)
#   # end

#   # count_array.size % 2 == 0

#   # solution from video 
#   # string.count('(') == string.count(')')

#   return false unless string.count('(') == string.count(')')

#   string_array = string.split("")
#   count = 0

#   string_array.each do 
#     |char|

#     if char == '('
#       count += 1
#     elsif char == ')'
#       count -= 1
#     end

#     return false if count < 0
#   end

#   return true
# end

# p balancer("hi")
# p balancer("(hi")
# p balancer("(hi)")
# p balancer("()hi())")
# p balancer("(()) )(")

# PRASTEVILA 
def is_prime?(number)
  (2..(number - 1)).each do |divisor|
    return false if number % divisor == 0
  end

  true
end

def find_primes(starting_num, ending_num)
  (starting_num..ending_num).select do |num|
    is_prime?(num)
  end
end

p find_primes(3, 10)

