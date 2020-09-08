# # class MyCar

# #   def self.gas_milage(gallons, miles)
# #     puts "#{miles / gallons} miles per gallon of gas"
# #   end
# # end

# # MyCar.gas_milage(13, 1220)


# # class Person
# #   attr_writer :name
# #   def initialize(name)
# #     @name = name
# #   end
# # end

# # bob = Person.new("Steve")
# # bob.name = "Bob"


# class Vehicle
#   @@num_of_vehicles = 0

#   def initialize
#     @@num_of_vehicles += 1
#   end

#   def self.numOfVehicles
#     puts "We have - #{@@num_of_vehicles} of vehicles"
#   end
# end

# class MyCar < Vehicle
#   WHEELS = 4
# end

# class MyTruck < Vehicle
#   WHEELS = 8
# end

# car = MyCar.new
# truck = MyTruck.new

# Vehicle.numOfVehicles




module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

truck = Transportation::Truck.new

p truck

