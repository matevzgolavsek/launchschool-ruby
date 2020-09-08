# class Cat
# end

# whiskers = Cat.new
# ginger = Cat.new
# paws = Cat.new

# p whiskers.object_id
# p ginger.object_id
# p paws.object_id

# p paws === ginger

# class Thing
# end

# class AnotherThing < Thing
# end

# class SomethingElse < AnotherThing
# end

# p Thing.ancestors


# module Flight
#   def fly; end
# end

# module Aquatic
#   def swim; end
# end

# module Migratory
#   def migrate; end
# end

# class Animal
# end

# class Bird < Animal
# end

# class Penguin < Bird
#   include Aquatic
#   include Migratory
# end

# pingu = Penguin.new
# p Penguin.ancestors



# class Animal
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     puts sound
#   end

#   def sound
#     "#{@name} says "
#   end
# end

# class Cow < Animal
#   def sound
#     super + "moooooooooooo!"
#   end
# end

# daisy = Cow.new("Daisy")
# daisy.speak

# class Person
#   def name
#     @name
#   end

#   def name=(name)
#     @name = name
#   end
# end

# kate = Person.new
# kate.name = 'Kate'
# p kate.name # => 'Kate'




# class Person
#   attr_writer :first_name, :last_name

#   def full_name
#     # omitted code
#     "#{first_name} #{last_name}"
#   end
# end

# mike = Person.new
# mike.first_name = 'Michael'
# mike.last_name = 'Garcia'
# p mike.full_name # => 'Michael Garcia'


# class Student
#   attr_accessor :name, :grade

#   def initialize(name)
#     @name = name
#     @grade = nil
#   end

#   def change_grade(new_grade)
#     grade = new_grade
#   end
# end

# priya = Student.new("Priya")
# priya.change_grade('A')
# p priya.grade # => "A"



# class Hello
#   # We are inside the body of the class, so `self`
#   # refers to the current instance of `Class`
#   p self

#   def foo
#     # We are inside an instance method, so `self`
#     # refers to the current instance of `Hello`
#     return self
#   end

#   # This defines a class method, since `self` refers to `Hello`
#   def self.bar
#     return self
#   end
# end

# h = Hello.new
# p h.foo
# p Hello.bar



class MeMyselfAndI
  p self

  def self.me
    p self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new
p MeMyselfAndI.me
p i.myself
