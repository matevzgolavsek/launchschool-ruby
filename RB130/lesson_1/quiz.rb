# def welcome(str)
#   puts str + yield
#   puts str + ' ' + (block_given? ? yield : '')
# end



# welcome('Hello') { 'there' } # => Hello there
# welcome('Hey') { 'Joe' } # => Hey Joe


# # [1, 2, 3, 4, 5].each do |number, a|
# #   puts "#{number} #{a} was passed to the block"
# #   p block_given?
# # end


# def true_or_false(&block)
#   puts "The block is #{block.call}"
# end

# true_or_false { 5 > 8 }


# def call_chunk(code_chunk)
#   code_chunk.call
# end

# say_color = Proc.new {puts "The color is #{color}"}
# color = "blue"
# call_chunk(say_color)

# puts [2, 3, 5].inject(1, &:+)

# puts [2, 3, 5].inject(1) { |total, num| total + num }
# puts [2, 3, 5].inject { |total, num| num + num }


ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do
  # block body
end