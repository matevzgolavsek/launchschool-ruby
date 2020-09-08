# module GuyModule
#   def speak
#     puts 'i are sine'
#   end
# end

# class Guy
#   include GuyModule

#   def initialize(name)
#     @name = name
#   end
# end

# sine = Guy.new('sine')

# sine.speak

# class MyCar
#   attr_accessor :color
#   attr_reader :year

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model

#     @current_speed = 0
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You push the gas and accelerate #{number} mph."
#   end

#   def brake(number)
#     @current_speed -= number
#     puts "You push the brake and decelerate #{number} mph."
#   end

#   def current_speed
#     puts "You are now going #{@current_speed} mph."
#   end

#   def shut_down
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "New car color #{color}"
#   end

#   def self.gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def to_s
#     "My car is #{year} old with #{color} color"
#   end
# end

# lumina = MyCar.new(1997, 'chevy lumina', 'white')
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# lumina.current_speed

# lumina.color = 'black'
# puts lumina.color
# puts lumina.year
# lumina.spray_paint('red')

# MyCar.gas_mileage(5, 1000)

# puts lumina


# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   def public_disclosure
#     puts "#{self.name} in human years is #{human_years}"
#   end

#   def a_public_method
#     puts "Will this work? " + self.a_protected_method
#   end

#   private

#   def human_years
#     age * DOG_YEARS
#   end

#   protected

#   def a_protected_method
#     "Yes, I'm protected!"
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# sparky.a_public_method

# fido = GoodDog.new("Sparky", 4)
# fido.a_public_method

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color
  attr_reader :model, :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model

    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "New car color #{color}"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def self.number_of_vehicles
    puts "There is #{@@number_of_vehicles}"
  end

  def age
    puts "My Vehicle is #{calculate_age} old"
  end

  private

  def calculate_age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_WHEELS = 4

  def to_s
    "My car is #{year} old with #{color} color"
  end
end

class MyTruck < Vehicle
  include Towable
  
  NUMBER_OF_WHEELS = 8

  def to_s
    "My truck is #{year} old with #{color} color"
  end
end

# sine = MyTruck.new
# p sine.can_tow?(500)

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

lumina.color = 'black'
puts lumina.color
puts lumina.year
lumina.spray_paint('red')

MyCar.gas_mileage(5, 1000)

puts lumina

lumina.age


class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other)
    @grade > other.grade
  end

  protected

  attr_accessor :grade
end

joe = Student.new('joe', 5)
bob = Student.new('bob', 3)

puts "Well done!" if joe.better_grade_than?(bob)


p Vehicle.ancestors
p Vehicle.instance_methods(false)
