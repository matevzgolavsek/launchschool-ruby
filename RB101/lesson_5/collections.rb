# 
# https://launchschool.com/lessons/c53f2250/assignments/f524e910
# 

# 1
arr = ['10', '11', '9', '7', '8']

arr = arr.sort_by do |num|
  - num.to_i
end

# or

arr.sort do |a,b|
  b.to_i <=> a.to_i
end

# 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by! do |book|
  book[:published]
end

p books


# 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [
  {
    first: ['a', 'b', 'c'],
    second: ['d', 'e', 'f']
  },
  {
    third: ['g', 'h', 'i']
  }
]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p arr1[2][1][3]
p arr2[1][:third][0]
p arr3[2][:third][0][0]
p hsh1['b'][1]
p hsh2[:third].key(0)


# 4
puts '__________________'

arr_1 = [1, [2, 3], 4]

arr_2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh_1 = {first: [1, 2, [3]]}

hsh_2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr_1[1][1] = 4
p arr_1

arr_2[2] = 4
p arr_2

hsh_1[:first][2][0] = 4
p hsh_1

hsh_2[['a']][:a][2] = 4
p hsh_2


# 5
puts '__________________'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# my solution
total_age = 0

munsters.each do |monster|
  total_age += monster[1]['age'] if monster[1]["gender"] == 'male'
end

p total_age

# answer
total_male_age = 0

munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age


# 6

puts '__________________'
# my solution
munsters.each do |monster, details|
  p "#{monster} is a #{details['age']} year-old (#{details['gender']})."
end

# answer 
munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end


# 7

puts '__________________'
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a


# 8 
puts '__________________'
hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'], 
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

# my solution
vowels = []

hsh.each do |key, array|
  array.each do |string|
    string.chars.count do |c| 
      vowels.push(c) if (c =~ /[aeiou]/i) == 0
    end 
  end
end

p vowels

# answer
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end


# 9 
puts '__________________'

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_arr|
  sub_arr.sort! do |a, b|
    b <=> a
  end
end

p arr


# 10

puts '__________________'

arr_hsh = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr_hsh.map do |hsh|
  incremented_hash = {}

  hsh.each do |key, val|
    incremented_hash[key] = val + 1
  end

  incremented_hash
end

p arr_hsh



# 11
puts '__________________'

arr_3 = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr_4 = arr_3.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end

p arr_4


# 12
puts '__________________'
arr_5 = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
arr_6 = {}

arr_5.each do |item|
  arr_6[item[0]] = item[1]
end

p arr_6


# 14
puts '__________________'

fruit_vegi = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}



fruit_vegi.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end


# 15
arr_7 = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr_7.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end


# 16

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end