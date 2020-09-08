# https://launchschool.com/lessons/c0400a9c/assignments/cd792c69

# def times(number)
#   counter = 0

#   while counter < number do
#     yield(counter)
#     counter += 1
#   end

#   number
# end

# times(5) do |num|
#   puts num
# end

# [1, 2, 3].each { |num| "do nothing" }                           # still returns [1, 2, 3]
# [1, 2, 3].each{|num| "do nothing"}.select{ |num| num.odd? }

# def each(array)
#   counter = 0

#   while counter < array.size
#     yield(array[counter])
#     counter += 1
#   end

#   array
# end

# each([1, 2, 3, 4, 5, 'bla', 'ble']) do |num|
#   puts num
# end

# p each([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }


# def select(array)
#   counter = 0
#   new_array = []

#   while counter < array.size
#     current_element = array[counter]
#     new_array << current_element if yield(current_element)

#     # new_array << array[counter] if yield(array[counter])

#     counter += 1
#   end

#   new_array
# end

# array = [1, 2, 3, 4, 5]

# p select(array) { |num| num.odd? }      # => [1, 3, 5]
# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true


def reduce(array, accumulator = 0)
  counter = 0
  current_result = accumulator

  while counter < array.size
    current_element = array[counter]
    sum = yield(current_result, current_element)

    current_result = sum
    counter += 1
  end

  current_result
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }