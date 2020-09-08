# def fizzbuzz(starting, ending)
#   fizzbuzz_array = []

#   (starting..ending).each do |item|
#     if item % 3 == 0 && item % 5 == 0
#       fizzbuzz_array << 'FizzBuzz'
#     elsif item % 3 == 0
#       fizzbuzz_array << 'Fizz'
#     elsif item % 5 == 0
#       fizzbuzz_array << 'Buzz'
#     else
#       fizzbuzz_array << item
#     end
#   end

#   puts fizzbuzz_array.join(', ')
# end

# fizzbuzz(1, 15)


PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 330 },
  { name: "Macbook Pro", price: 330 },
  { name: "Macbook", price: 330 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 }
]

query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}


def search(query)
  search_array = []

  search_array = PRODUCTS.select { |computer|
    computer[:name].downcase.include?(query[:q]) &&
    (query[:price_min]..query[:price_max]).include?(computer[:price])
  }

  puts search_array
end

# p b_movies=movies.select{|movie| movie[:title].downcase.include?("b")}.map{|movie| movie[:id]}


search(query)
# [{ name: "Thinkpad x220", price: 250 }]

search(query2)
# [{ name: "Dell Inspiron", price: 300 },
#  { name: "Dell Inspiron", price: 450 }]

