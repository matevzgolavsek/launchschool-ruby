# # class Machine
  

# #   def start
# #     flip_switch(:on)
# #   end

# #   def stop
# #     flip_switch(:off)
# #   end

# #   def current_switch
# #     switch
# #   end

# #   private

# #   attr_reader :switch
# #   attr_writer :switch

# #   def flip_switch(desired_state)
# #     self.switch = desired_state
# #   end
# # end

# # bla = Machine.new

# # bla.stop
# # p bla.current_switch


# class FixedArray
#   def initialize(length)
#     @array = Array.new(length) { nil } 
#   end

#   def [](num)
#     @array.fetch(num)
#   end

#   def []=(num, val)
#     self[num]
#     @array[num] = val
#   end

#   def to_a
#     @array.clone
#   end

#   def to_s
#     @array.to_s
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end



