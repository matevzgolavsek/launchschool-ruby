# def step(start_val, end_val, step_val)
#   current_val = start_val

#   (start_val..end_val).each do |item|
#     yield(current_val)  

#     current_val += step_val

#     break if current_val > end_val
#   end

#   current_val
# end

# step(1, 11, 3) { |value| puts "value = #{value}" }


# def zip(array_1, array_2)
#   new_array = []
#   counter = 0

#   while counter < array_1.size
#     new_array << [array_1[counter], array_2[counter]]
#     counter += 1
#   end

#   new_array
# end

# p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]


# def map(array)
#   new_array = []

#   array.each do |item|
#     new_array << yield(item)
#   end

#   new_array
# end

# p map([1, 3, 6]) { |value| value**2 } # == [1, 9, 36]
# p map([]) { |value| true } # == []
# p map(['a', 'b', 'c', 'd']) { |value| false } # == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } # == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } # == [[1], [1, 2, 3], [1, 2, 3, 4]]

# def count(*arguments)
#   counter = 0

#   arguments.each do |item|
#     counter += 1 if yield(item)
#   end
#   # counter += 1 if yield(arg1)
#   # counter += 1 if yield(arg2)
#   # counter += 1 if yield(arg3)

#   counter
# end

# p count(1, 3, 6) { |value| value.odd? } # == 2
# p count(1, 3, 6) { |value| value.even? } # == 1
# p count(1, 3, 6) { |value| value > 6 } # == 0
# p count(1, 3, 6) { |value| true } # == 3
# p count() { |value| true } # == 0
# p count(1, 3, 6) { |value| value - 6 } # == 3


# def drop_while(array)
#   # new_array = []

#   # array.each do |item|
#   #   new_array << item if !yield(item)
#   # end

#   # new_array

#   counter = 0
#   while counter < array.size && yield(array[counter])
#     counter += 1
#   end

#   array[counter..-1]
# end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } # == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } # == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } # == []
# p drop_while([1, 3, 5, 6]) { |value| false } # == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } # == [5, 6]
# p drop_while([]) { |value| true } # == []

# def each_with_index(array)
#   # current_index = 0

#   # while current_index < array.size
#   #   yield(array[current_index], current_index)

#   #   current_index += 1
#   # end

#   index = 0
#   array.each do |item|
#     yield(item, index)
#     index += 1
#   end
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]



# def each_with_object(array, result_array)
#   array.each do |item|
#     yield(item, result_array)
#   end
#   result_array
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end

# p result == [1, 9, 25]


# result_2 = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result_2 == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]


# result_3 = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result_3 == { 1 => 1, 3 => 9, 5 => 25 }


# result_4 = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result_4 == {}

# def max_by(array)
#   # largest = array[0]
#   # current_largest = 0

#   # array.each do |item|
#   #   p yield(item)
#   #   current_largest = yield(item) if yield(item) > current_largest
#   #   largest = item if yield(item) > current_largest
#   # end

#   # largest

#   return nil if array.empty?

#   max_element = array.first
#   largest = yield(max_element)

#   array[1..-1].each do |item|
#     yielded_value = yield(item)
#     if largest < yielded_value
#       largest = yielded_value
#       max_element = item
#     end
#   end

#   max_element
# end


# # p max_by([1, 5, 3]) { |value| value + 2 } # == 5
# # max_by([1, 5, 3]) { |value| 9 - value } # == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } # == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } # == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } # == -7
# p max_by([]) { |value| value + 5 } # == nil


# def each_cons(array)
#   array.each_with_index do |value, index|
#     break if index + 1 >= array.size
#     yield(value, array[index + 1]) # if index + 1 < array.size
#   end

#   nil
# end

# hash = {}

# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end

# p result # == nil
# p hash # == { 1 => 3, 3 => 6, 6 => 10 }

# hash2 = {}
# result2 = each_cons([]) do |value1, value2|
#   hash2[value1] = value2
# end
# p hash2 # == {}
# p result2 # == nil

# hash3 = {}
# result3 = each_cons(['a', 'b']) do |value1, value2|
#   hash3[value1] = value2
# end
# p hash3 # == {'a' => 'b'}
# p result3 # == nil

def each_cons_2(array, num_of_elements)

  # array.each_with_index do |value, index|
  #   counter = 0

  #   break if index + num_of_elements > array.size  

  #   while counter < num_of_elements

  #     yield(value, array[index + counter])

  #     counter += 1
  #   end
  # end

  # nil

  array.each_index do |index|
    break if index + num_of_elements - 1 >= array.size
    yield(*array[index..(index + num_of_elements - 1)])
  end
  nil
end

hash = {}
each_cons_2([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash # == { 1 => true, 3 => true, 6 => true, 10 => true }

hash2 = {}
each_cons_2([1, 3, 6, 10], 2) do |value1, value2|
  hash2[value1] = value2
end
p hash2 #== { 1 => 3, 3 => 6, 6 => 10 }


hash3 = {}
each_cons_2([1, 3, 6, 10], 3) do |value1, *values|
  hash3[value1] = values
end
p hash3 #== { 1 => [3, 6], 3 => [6, 10] }