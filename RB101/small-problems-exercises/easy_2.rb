def show_multiplicative_average(numbers)
  product = 1
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average([3, 5])