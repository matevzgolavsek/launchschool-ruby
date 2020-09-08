
# module MyModule
#   def my_method
#     "Ti si pengvin"
#   end
# end

# class SomeClass
#   include MyModule
# end

# classy = SomeClass.new

# p classy.my_method


# class MyCar
#   attr_accessor :color
#   attr_reader :year

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#   end

#   def speed_up(amount)
#     @current_speed += amount
#     puts "You push the gas and accelerate #{amount} mph."
#   end

#   def break(amount)
#     @current_speed -= amount
#     puts "You push the break and slow down #{amount} mph."
#   end

#   def shut_off
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def current_speed
#     puts "You are now going #{@current_speed} mph."
#   end

#   def spray_paint(new_color)
#     self.color = new_color
#     puts "Your new #{color} paint job looks great!"
#   end

#   def gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def to_s
#     "I have a #{year} #{@model} car that is #{color} color"
#   end
# end

# lumina = MyCar.new(1997, 'chevy lumina', 'white')
# lumina.speed_up(20)
# lumina.current_speed

# lumina.spray_paint('red')
# lumina.gas_mileage(15, 1700)

# puts lumina

module CarModule
  def unique
    puts "im unique module"
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year

  @@number_of_vehicle = 0

  def self.total_vehicles
    puts "Total vehicles: #{@@number_of_vehicle}"
  end

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicle += 1
  end

  def speed_up(amount)
    @current_speed += amount
    puts "You push the gas and accelerate #{amount} mph."
  end

  def break(amount)
    @current_speed -= amount
    puts "You push the break and slow down #{amount} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Your new #{color} paint job looks great!"
  end

  def gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "I have a #{year} #{@model} car that is #{color} color"
  end

  def age
    "Your #{@model} is #{calculate_age} years old."
  end

  private 

  def calculate_age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  include CarModule

  NUMBER_OF_DOORS = 3
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 4
end

# lumina = MyCar.new(1997, 'chevy lumina', 'white')
# puts lumina
# puts lumina.age


class Student
  attr_reader :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other)
    grade > other.grade
  end

  protected 

  def grade
    @grade
  end
end

joe = Student.new('Joe', 5)
john = Student.new('John', 3)

puts "Well done!" if joe.better_grade_than?(john)
