# def digit_list(number)
#   remainder = number.divmod(10)

#   puts "#{number} - number"
#   puts "#{remainder} - remainder"
# end

# digit_list(12345)

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# def count_occurrences(cars)
#   occurrences = {}

#   cars.uniq.each do |car|
#     occurrences[car] = cars.count(car)
#   end

#   occurrences.each do |item, count|
#     p "#{item} => #{count}"
#   end
# end


# count_occurrences(vehicles)

# def reverse_sentence(sentence)
#   sentence.split(' ').reverse.join(' ')
# end

# p reverse_sentence('Hello World')


# def reverse_sentence(sentence)
#   array_of_words = sentence.split(' ')
#   new_array = []

#   array_of_words.each do |word|
#     word.reverse! if word.size >= 5
#     new_array << word
#   end

#   array_of_words.join(' ')
# end

# p reverse_sentence('Hello World')

# def stringy(num)
#   num_array = []

#   num.times do |index|
#     if index.even?
#       num_array << 1
#     else
#       num_array << 0
#     end
#   end

#   num_array.join('')
# end

# puts stringy(6)

# def average(numbers)
#   # numbers.sum / numbers.size
#   sum = numbers.reduce do |sum, number|
#     p sum
#     p number
#     sum + number
#   end
# end

# puts average([1, 5, 87, 45, 8, 8])

# def sum(number)
#   sum = 0
#   str_digits = number.to_s.chars

#   str_digits.each do |str_digit|
#     sum += str_digit.to_i
#   end

#   sum
# end

# puts sum(23)
# puts sum(496)



# def calculate_bonus(salary, bonus)
#   bonus ? (salary / 2) : 0
# end

# puts calculate_bonus(2800, true)

# def rotate_array(array)
#   array[1..-1] + [array[0]]
#   # array << array[0]
#   # array.delete_at(0)
#   # p array
# end

# # x = [1, 2, 3, 4]
# # rotate_array(x) == [2, 3, 4, 1]   # => true
# # x == [1, 2, 3, 4] 

# def rotate_rightmost_digits(number, digit)
#   new_array = number.to_s.split('')
#   p new_array[-digit]

#   p new_array[0..-digit - 1]
#   new_array[-digit..-1] = rotate_array(new_array[-digit..-1])

#   new_array.join('').to_i
# end

# p rotate_rightmost_digits(735291, 5)

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(3)

