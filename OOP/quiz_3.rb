# # # # # str1 = "I'm a string"
# # # # # str2 = str1

# # # # # p str1 == str2
# # # # # p str1.equal?(str2)
# # # # # p str1.eql?(str2)
# # # # # p str1.object_id == str2.object_id


# # # # str1 = "I am a string"
# # # # str2 = "I am a string"
# # # # p str1
# # # # p str2

# # # # p str1 == str2
# # # # p str1.equal?(str2)
# # # # p str1 === str2
# # # # p (str1 <=> str2) == 0



# # # class Thing
# # #   attr_accessor :size

# # #   def initialize(s)
# # #     @size = s
# # #   end

# # #   def ==(other_thing)
# # #     size == other_thing.size
# # #   end
# # # end

# # # thing1 = Thing.new(5)
# # # thing2 = Thing.new(5)
# # # thing3 = thing1
# # # thing1.size = 4

# # # p thing1
# # # p thing2
# # # p thing3

# # # p thing2 == thing3
# # # p thing3.equal? thing2
# # # p thing3.equal? thing1


# # class Circle
# #   attr_reader :radius

# #   def initialize(r)
# #     @radius = r
# #   end

# #   def >(other)
# #     radius > other.radius
# #   end

# #   def ==(other)
# #     radius == other.radius
# #   end
# # end

# # circle1 = Circle.new(5)
# # circle2 = Circle.new(3)
# # circle3 = Circle.new(5)

# # p circle3 < circle2



# module Speedy
#   def run_fast
#     @speed = 70
#   end
# end

# class Animal
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Dog < Animal
#   DOG_YEARS = 7

#   def initialize(name, age)
#     @dog_age = age * DOG_YEARS
#   end
# end

# class Greyhound < Dog
#   include Speedy
# end

# grey = Greyhound.new('Grey', 3)

# p grey



class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end


p Triangle.sides


# module Describable
#   # SIDES = nil

#   def describe_shape
#     "I am a #{self.class} and have #{self.class::SIDES} sides."
#   end
# end

# class Shape
#   include Describable

#   def self.sides
#     self::SIDES
#   end
# end

# class Quadrilateral < Shape
#   SIDES = 4

#   def sides
#     SIDES
#   end
# end

# class Square < Quadrilateral; end

# p Square.sides # => 4
# p Square.new.sides # => 4
# p Square.new.describe_shape # => "I am a Square and have 4 sides."


