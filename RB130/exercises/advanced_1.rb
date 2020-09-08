# num = Enumerator.new do |yielder|
#   accumulator = 1
#   number = 0

#   loop do
#     accumulator = number.zero? ? 1 : accumulator * number

#     yielder << accumulator
#     number += 1
#   end
# end

# # num_array = num.take(10)

# # p num_array # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# # def calculate_fib(array)
# #   result = (1..array.size).inject { |sum, n| sum * n }
# #   result
# # end

# # p calculate_fib(num_array)


# # External iterators

# 6.times { |number| puts "#{number}! == #{num.next}" }
# puts "=========================="
# 6.times { |number| puts "#{number}! == #{num.next}" }
# puts "=========================="
# num.rewind
# 6.times { |number| puts "#{number}! == #{num.next}" }
# puts "=========================="


# # Internal iterators

# num.each_with_index do |value, number|
#   puts "#{number}! == #{value}"
#   break if number >= 5
# end




# Group 1
my_proc = proc { |thing, thing2| puts "This is a #{thing} and #{thing2}" }

puts "my_proc --------------"
puts my_proc

puts "my_proc.class --------------"
puts my_proc.class

puts "my_proc.call --------------"
my_proc.call

puts "my_proc.call('cat)') --------------"
my_proc.call('cat')

puts "======================"

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }

puts "my_lambda --------------"
puts my_lambda

puts "my_second lambda --------------"
puts my_second_lambda

puts "my_lambda.class --------------"
puts my_lambda.class

puts "my_lambda.call --------------"
my_lambda.call('dog call')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

puts "======================"

# Group 3
def block_method_1(animal)
  yield
end

puts "block_method_1 --------------"
block_method_1('seal') { |seal| puts "This is a #{seal}."}

puts "block_method_1 / 2--------------"
# Missing block - thats why it is commented out
# block_method_1('seal')


# Group 4
def block_method_2(animal)
  yield(animal)
end

puts "block_method_2 --------------"
block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}

puts "block_method_2 / 2 --------------"
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

puts "block_method_2 / 3 --------------"
block_method_2('turtle') { puts "This is a #{animal}."}


# Group 1
# Doesn't return any errors even if number of arguments is not the same

# Group 2
# Lambdas are subclass of Proc
# Number of arguments need to match
# Lambda class doesn't exist

# Group 3
# First call will return 'This is a .' without any argument because we didn't pass it to yield
# Second will raise no block given error

# Group 4
# First will alright, display as it should
# Second will only return This is a turtle and a without $seal variable
# Third will ofcourse return undefined variable animal because we didn't include
# argument to it's block



# Group 1:
# A new Proc object can be created with a call of proc instead of Proc.new
# A Proc is an object of class Proc
# A Proc object does not require that the correct number of arguments are passed to it. If nothing is passed, then nil is assigned to the block variable.


# Group 2
# A new Lambda object can be created with a call to lambda or ->. We cannot create a new Lambda object with Lambda.new
# A Lambda is actually a different variety of Proc.
# While a Lambda is a Proc, it maintains a separate identity from a plain Proc. This can be seen when displaying a Lambda: the string displayed contains an extra "(lambda)" that is not present for regular Procs.
# A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an error is thrown.


# Group 3
# A block passed to a method does not require the correct number of arguments. If a block variable is defined, and no value is passed to it, then nil will be assigned to that block variable.
# If we have a yield and no block is passed, then an error is thrown.


# Group 4
# If we pass too few arguments to a block, then the remaining ones are assigned a nil value.
# Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.


# Comparison
# Lambdas are types of Proc's. Technically they are both Proc objects. 
# An implicit block is a grouping of code, a type of closure, it is not an Object.
#
# Lambdas enforce the number of arguments passed to them. 
# Implicit blocks and Procs do not enforce the number of arguments passed in.