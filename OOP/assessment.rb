# module Speak
#   def speak
#     puts 'im in module'
#   end
# end

# module Speak2
#   def speak
#     puts 'im in module speak 2'
#   end
# end

# class Animal
#   include Speak
#   include Speak2

#   def initalize(bla)
#     @name = bla
#   end

#   def speak
#     puts 'inside class'
#   end

#   def self.instance_method
#     puts "instance #{@bla}"
#   end
# end

# class Dog < Animal
#   def speak
#     puts 'inside subclass'
#   end
# end

# bla = Dog.new

# bla.speak

# p Animal.ancestors

# Animal.instance_method

# class Dog
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(name)
#     @name = name
#   end
# end

# john = Dog.new('john')

# puts john.name
# john.name = "sine"
# puts john.name

# # class Test
# #   def self.square(b)
# #     if b > 0
# #       b * b
# #     end
# #   end
# # end

# # p Test.square(0)
# # p Test.square(5).class


class Doggy

  def i_am_self
    self.sine
  end

  def sine 
    'bla'
  end
end

johnny = Doggy.new
p johnny.i_am_self



# # class Doggy
# #   def i_am_self
# #     self
# #   end

# #   def name 
# #     'johnny'
# #   end
# # end

# # johnny = Doggy.new
# # p johnny.i_am_self


# module Swimmable
# end

# module Aquatic
# end

# class Animal
# end

# class Fish < Animal
#   include Aquatic
#   include Swimmable
# end

# class ClownFish < Fish
# end

# nemo = ClownFish.new
# marlin = ClownFish.new

# p nemo.object_id
# p marlin.object_id

# p nemo == marlin # returns false

# p nemo.object_id

# p nemo.method(:==).source_location

# module ArmorMethods
#   def attach_armor
#   end

#   def remove_armor
#   end
# end

# module CastMethods
#   def cast_spell(spell)
#   end
# end

# module BardMethods
#   def create_potion
#   end
# end

# class Game
#   def initialize(players)
#     @players = players
#   end
# end

# class Player
#   attr_reader :name, :pclass, :strength, :int

#   def initialize(name, pclass, strength = roll_dice, int = roll_dice)
#     @name = name
#     @health = 100
#     @pclass = pclass
#     @strength = strength
#     @int = int

#     changeStartingInfo(pclass)
#   end

#   def heal(num)
#     @health += num
#   end

#   def hurt(num)
#     @health -= num
#   end

#   def to_s 
#     puts "Name: #{name}"
#     puts "Class: #{pclass}"
#     puts "Health: #{100}"
#     puts "Strength: #{strength}"
#     puts "Inteligence: #{int}"
#   end

#   private

#   def roll_dice
#     [2,3,4,5,6,7,8,9,10,11,12].sample
#   end

#   def changeStartingInfo(pclass)
#     if (pclass == 'Warrior')
#       (class << self; include ArmorMethods; end)
#       @strength += 2
#     elsif (pclass == 'Magician')
#       (class << self; include CastMethods; end)
#       @int += 2
#     elsif (pclass == 'Paladin')
#       (class << self; include ArmorMethods; end)
#       (class << self; include CastMethods; end)
#     elsif (pclass == 'Bard')
#       (class << self; include CastMethods; end)
#       (class << self; include BardMethods; end)
#     end
#   end
# end

# class Warrior < Player
#   def initialize
#     @pclass = 'Warrior'
#     # @strength = strength + 2

#     puts @strength
#   end

#   def to_s
#     'Warrior'
#   end
# end

# sine = Player.new('sine', 'Warrior')

# sine.to_s





# class Parent
#   private

#   def name
#     puts 'i are name'
#   end
# end

# class Child < Parent

# end



# class PetShelter
#   def initialize(shelter_name)
#     @shelter_name = shelter_name
#     @cats = []
#     @dogs = []
#   end

#   def add_pet(pet)
#     if(pet.type == 'cat')
#       @cats << pet
#     elsif(pet.type == 'dog')
#       @dogs << pet
#     end
#   end
# end

# class Pet
#   attr_reader :type

#   def initialize(name)
#     @name = name
#   end
# end

# class Cat < Pet
#   def initialize(name)
#     super
#     @type = 'cat'
#   end
# end

# class Dog < Pet
#   def initialize(name)
#     super
#     @type = 'dog'
#   end
# end


# pingo = Cat.new('Pingo')
# steve = Dog.new('Steve')
# jackie = Dog.new('Jackie')

# shelter = PetShelter.new('Lake')

# shelter.add_pet(pingo)
# shelter.add_pet(steve)
# shelter.add_pet(jackie)

# p shelter
#<PetShelter:0x00007fd1671685b0 @shelter_name="Lake", @cats=[#<Cat:0x00007fd167168718 @name="Pingo", @type="cat">], @dogs=[#<Dog:0x00007fd1671686a0 @name="Steve", @type="dog">, #<Dog:0x00007fd167168628 @name="Jackie", @type="dog">]>


module ArmorModule
  def attach_armor
    puts 'Armor attached'
  end

  def remove_armor
    puts 'Armor removed'
  end
end

module SpellsModule
  def cast_spell
    puts 'Casting spell'
  end
end

class Game
end

class Player
  attr_reader :name, :health, :strength, :int, :char

  def initialize(name, strength = roll_dice, int = roll_dice)
    @name = name
    @health = 100
    @strength = strength
    @int = int
    @char = self.class
  end

  def heal(amount)
    @health += amount
  end

  def hurt(amount)
    @health -= amount
  end

  def to_s 
    <<~INFO
      Name: #{name}
      Health: #{health}
      Class: #{char}
      Strength: #{strength}
      Inteligence: #{int}
    INFO
  end

  private

  def roll_dice
    [2,3,4,5,6,7,8,9,10,11,12].sample
  end
end

class Warrior < Player
  include ArmorModule

  def initialize(name, strength = roll_dice, int = roll_dice)
    super
    @strength += 2
  end
end

class Magician < Player
  include SpellsModule

  def initialize(name, strength = roll_dice, int = roll_dice)
    super
    p "#{self.class} have #{int}"
    @int += 2
  end
end

class Paladin < Player
  include ArmorModule
  include SpellsModule
end

class Bard < Magician
  def create_potion
    puts 'I have created a potion'
  end
end

sine_warrior = Warrior.new('sine the warrior', 10, 1)
sine_magician = Magician.new('sine the magician')
sine_paladin = Paladin.new('sine the paladin')
sine_bard = Bard.new('sine the bard', 1, 1)

puts sine_warrior
puts "----------------"
puts sine_magician
puts "----------------"
puts sine_paladin
puts "----------------"
puts sine_bard

sine_bard.create_potion

# Name: sine the warrior
# Health: 100
# Class: Warrior
# Strength: 12
# Inteligence: 1
# ----------------
# Name: sine the magician
# Health: 100
# Class: Magician
# Strength: 12
# Inteligence: 12
