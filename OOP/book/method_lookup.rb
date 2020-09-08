# module ExtendSpeak
#   def speak
#     'i are speaking'
#   end
# end

# module Walk
#   def walk(sound)
#     puts "#{sound}"
#   end
# end

# class Animal
#   include Walk
# end

# class Cat < Animal
#   def speak
#     "Meow Meow!"
#   end
# end

# puts Cat.ancestors

# p Cat.instance_methods
# p Walk.instance_methods(false)
# p Cat.instance_methods(false).include?(:speak)

# cat = Cat.new
# cat2 = Cat.new

# def cat.speak
#   'defined in singleton' + super
# end

# cat.extend(ExtendSpeak)

# puts cat.speak
# puts cat2.speak



# class Cat
#   def speak
#     "Meow Meow!"
#   end
# end

# cat_object = Cat.new

# def cat_object.speak
#   "Meowing from singleton"
# end

# puts cat_object.speak


# module SpeakModule
#   def speak
#     "Meowing from module"
#   end
# end

# class Cat
#   def speak
#     "Meow Meow!"
#   end
# end

# cat_object = Cat.new
# cat_object.extend(SpeakModule)

# cat_object.speak


module SpeakModule
  def speak
    "Meowing from module"
  end
end

module SpeakModule2
  def speak
    "Meowing from module 2"
  end
end

class Cat
  include SpeakModule
  include SpeakModule2
end

cat_object = Cat.new

puts cat_object.speak #=> "Meowing from module 2"

cat_object.fly

# p Cat.ancestors