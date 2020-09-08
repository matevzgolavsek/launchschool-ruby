# Variable shadowing
# Array#each, Array#map, Array#select
# check https://medium.com/how-i-started-learning-coding-from-scratch/advice-for-109-written-assessment-part-3-d39dceb06c0c
# https://launchschool.com/lessons/3ce27abc/assignments/cd8e4629


# Format def - Round up/down integer in our case at lesson2 - loan_calculator
format('%02.2f', '10.61234') # => 10.61

# Variable scopes same as Javascript unly that CONSTANTS are applied globally no metter scoping

# Variables - assigning
str_1 + str_2   # will return new str
str_1 += str_2  # is reassigning str_1 variable
str_1 << str_2  # is destructible method that will change str_1 object


# Delete method
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # => return [1, 3, 4, 5] - delete at key/index
numbers.delete(1) # => return [2, 3, 4, 5] - delete exact same



# Flatten method - change from nested arrays to only 1 array
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
flintstones.flatten! # return => ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]


# Assoc method - turn key and value from hash/object to array
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.assoc("Barney") # return => ["Barney", 2]

# Fetch method - when looking for a key in array is better to use as if key is not found you get
# an error "key not found" rather then nil result 

# Chars method
str = 'Practice'

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]

arr.join # => "Practice"

# Keep if method
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if { |_, age| age < 100 }

# Minimum value from hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min


# Find index of first item that starts with Be
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index { |name| name[0, 2] == "Be" }


# Map - return array of strings with first 3 chars
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name|
  name[0, 3]
end


numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end


# Comparing items in array and sort them
[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
# a is 2 and b is 5
# a is 4 and b is 1
# a is 3 and b is 1
# a is 3 and b is 4
# a is 2 and b is 1
# a is 2 and b is 3
# a is 5 and b is 3
# a is 5 and b is 4
# => [1, 2, 3, 4, 5]


# dup and clone methods
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d" # => RuntimeError: can't modify frozen Array

arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]

# freeze method means that you can't modify array on which freeze is called but can modify inner objects
arr = ["a", "b", "c"].freeze
arr << "d" # can't modify frozen Array

arr = ["a", "b", "c"].freeze
arr[2] << "d" # ["a", "b", "cd"]


# Debugging with pry
# binding.pry is scoped based.. so withing method you will have access to variables
# but not global that werent assigned yet
# inside pry console we can do method whereami X (x = lines of code up and down) to show 


# Fetch vs [X]
hsh = {
  a: 1
}

hsh['a'] # => nil
hsh.fetch('a') # => key not found
# so better to use fetch vs first option

hsh.fetch(:a) # => 1


# select returns a new array based on the block's return value. If the return value evaluates
# to true, then the element is selected.

num_arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

odds = num_arr.select do |n|
  n + 1
  puts n
end


# map returns a new array based on the block's return value. Each element is
# transformed based on return value

incremented = arr.map do |n| 
  n + 1
end


```ruby
odds = num_arr.select do |n|
  n + 1
  puts n
end
```