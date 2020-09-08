# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   # def hi
#   #   greet("Hello")
#   # end

#   def self.hi
#     greeting = Greeting.new
#     greeting.greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# Hello.hi


class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I'm #{type} cat"
  end
end

tabs = Cat.new('tabby')
p tabs