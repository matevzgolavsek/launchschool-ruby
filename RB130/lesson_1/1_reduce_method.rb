def reduce(array, accumulator = 0)
  counter = 0
  result = 0

  while counter < array.size
    result = yield(result, array[counter])
    counter += 1
  end

  result + accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }