# def is_prime?(number)
#   return false if number == 1 # Guard for number 1 as it is true and it is not a prime

#   (2..(number - 1)).each do |item|
#     return false if number % item == 0
#   end

#   true
# end

# p is_prime?(3)
# p is_prime?(4)
# p is_prime?(5)


# def select_primes(array_of_num)
#   array_of_num.select do |num|
#     is_prime?(num)
#   end
# end

# p select_primes([1, 2, 3, 4, 5, 6, 7, 8])
# p select_primes([4, 6, 8, 10])

# def count_primes(array_of_num)
#   array_of_num.count do |value|
#     is_prime?(value)
#   end
# end

# p count_primes([1, 2, 3, 4])

#
# 2
#
# def prompt(message)
#   puts ">> #{message}"
# end

# def sum(number)
#   sum = 0
#   (1..number).each do |num|
#     sum += num
#   end

#   sum
# end

# def product(number)
#   product = 1
#   (1..number).each do |num|
#     product *= num
#   end

#   product
# end

# prompt 'Please enter an integer greater than 0:'
# integer = gets().chomp().to_i

# prompt "Enter 's' to compute the sum, 'p' to compute the product"
# compute = gets().chomp()

# result = ''
# if(compute == 'p')
#   result = product(integer)
#   prompt "The sum of integers between 1 and #{integer} is #{result}"
# else
#   result = sum(integer)
#   prompt "The sum of integers between 1 and #{integer} is #{result}"
# end


def interleave(array_1, array_2)
  new_array = []
  array_size = array_1.size 

  (0..(array_size - 1)).each do |index|
    new_array << array_1[index]
    new_array << array_2[index]
  end

  new_array
end

p interleave([1,2,3], ['a', 'b', 'c'])


