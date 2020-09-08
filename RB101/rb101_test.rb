# my_hash = {a: [1, 2], b: [3, 4], c: [5, 6]}

# my_hash.each do |letter, arr|
#   arr.each do |num|
#     puts num + 1
#   end
# end

# [1, 2, 3].map {|n| 
#   puts "object id 1 - #{n} - #{n.object_id}" 
#   n + 1
#   puts "object id 2 - #{n} - #{n.object_id}" 
# }

# [1, 2, 3].map {|n| 
#   puts "object id 3 - #{n} - #{n.object_id}" 
#   n += 1
#   puts "object id 4 - #{n} - #{n.object_id}" 
# }


arr = [1, 2, 3].select do |n|
  n + 2
end

p arr