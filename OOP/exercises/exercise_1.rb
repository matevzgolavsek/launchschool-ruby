# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class

# Module needs to be before class
module Walkable
  def walk 
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

kitty.name = 'Luna'
kitty.greet
kitty.walk