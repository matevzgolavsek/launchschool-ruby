# class Cat
#   attr_reader :name
#   @@total_cats = 0

#   def initialize(name)
#     @name = name
#     @@total_cats += 1
#   end

#   def jump
#     "#{name} is jumping!"
#   end

#   def self.total_cats
#     @@total_cats
#   end

#   def to_s
#     @name
#   end
# end

# mitzi = Cat.new('Mitzi')
# p mitzi.jump # => "Mitzi is jumping!"
# p Cat.total_cats # => 1
# p "The cat's name is #{mitzi}" # => "The cat's name is Mitzi"


# class Student
#   # class body
#   attr_accessor :name
#   attr_writer :grade

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# jon = Student.new('John', 22)
# p jon.name # => 'John'
# p jon.name = 'Jon'
# p jon.grade = 'B'
# p jon.grade # => 'B'



# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} is speaking."
#   end
# end

# class Knight < Character
#   def name
#     "Sir " + super
#   end
# end

# sir_gallant = Knight.new("Gallant")
# p sir_gallant.name # => "Sir Gallant"
# p sir_gallant.speak # => "Sir Gallant is speaking."



# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} is speaking."
#   end
# end

# class Thief < Character
#   def speak
#     "#{name} is whispering."
#   end
# end

# sneak = Thief.new("Sneak")
# p sneak.name # => "Sneak"
# p sneak.speak # => "Sneak is whispering..."



# class FarmAnimal
#   def speak
#     "#{self.class} says "
#   end
# end

# class Sheep < FarmAnimal
#   def speak
#     super + "baa!"
#   end
# end

# class Lamb < Sheep
#   def speak
#     super + "baaaaaaa!"
#   end
# end

# class Cow < FarmAnimal
#   def speak
#     super + "mooooooo!"
#   end
# end

# p Sheep.new.speak # => "Sheep says baa!"
# p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
# p Cow.new.speak # => "Cow says mooooooo!"


class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)

p .ancestors