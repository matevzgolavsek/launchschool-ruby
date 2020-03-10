# 
# https://launchschool.com/lessons/263069da/assignments/fd13de08
# 

nums = [1, 2, 3]

nums.select do |num|
  num > 5
  'hi'
end

puts nums