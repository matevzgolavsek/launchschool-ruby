# 
# https://launchschool.com/lessons/263069da/assignments/86725689
# 

# Q1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.key?("Spot")
puts ages.has_key?("Spot")

# Possible solutions are also Hash#include? and Hash#member?


# Q2
munsters_description = "The Munsters are creepy in a good way."

puts munsters_description.swapcase
puts munsters_description.capitalize
puts munsters_description.downcase
puts munsters_description.upcase


# Q3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages) # return => {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237}
puts ages



# Q4
advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.include?('Dino')
puts advice.match?('Dino')

# Note that this is not a perfect solution, as it would match any substring with Dino in it.



# Q5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Q6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino'

puts flintstones

# Q7
flintstones.push('Dino').push('Hoppy') 

# Q8
advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.slice!(0, advice.index('house'))


# Q9
statement = "The Flintstones Rock!"

puts statement.count('t')


# Q10

title = "Flintstone Family Members"

puts title.center(40)