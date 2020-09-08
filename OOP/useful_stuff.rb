# CRC MODEL
# https://launchschool.com/lessons/dfff5f6b/assignments/3b584726
# Class name - Responsebilitie - Collaborators


# super inside a subclass means it will take method from superclass and not fully override
# we need to pass parameters also in super
# def a_method(one, two, three)
#   super(one, three)
# end

# to_s method exists in every class as default but we can override it

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "I'm #{name}!"
#   end
# end

#############################################
# What is OOP?
#############################################

# Object oriented programming is a paradigm that was created to deal with large complex programs.
# One small change in program would trigger a ripple effect to errors due to 
# dependencies throughout the entire program.
# Programmers needed a way to create containers for data that could be changed and manipulated
# without affecting the entire program. They needed a way to section off different areas of code
# that performed certain procedures so that their programs could become the interaction of many
# small parts and not one big piece of code.

#############################################
# BENEFITS OF OOP
#############################################
# Because there are so many benefits to using OOP we will just summarize some of the major ones:

# Creating objects allows programmers to think more abstractly about the code they are writing.
# Objects are represented by nouns so are easier to conceptualize.
# It allows us to only expose functionality to the parts of code that need it, 
# meaning namespace issues are much harder to come across.
# It allows us to easily give functionality to different parts of an application
# without duplication.
# We can build applications faster as we can reuse pre-written code.
# As the software becomes more complex this complexity can be more easily managed.

#############################################
# ENCAPSULATION
#############################################
# Encapsulation is form of data protection. Data cannot be manipulated or changed
# withut obvious intention. We hide pieces of functionality and making it unavaliable to
# the rest of the code. Unless we specify public methods and that way we can get/change data.
# With that in mind it is hard that we will mess the data.

#############################################
# PUBLIC, PRIVATE AND PROTECTED METHODS
#############################################
# Public methods are methods that can be called anywhere in the program

# Private method is a method that is only accessible from other methods in the class. 
# So by that it means we can't call it outside of a class definition at all, and are
# only accessible from inside the class when called without self.
# You can never call method from outside the class hierarchy where it was defined.

# Protected: You can call a protected method with an implicit receiver, 
# just like private, but in addition you can call a protected method
# with an explicit receiver as long as this receiver is self or an object
# of the same class as self
# Example: with n protected method, c1 can ask c2 to execute c2.n, 
# because c1 and c2 are both instances of the same class

# class Animal
#   def a_public_method
#     "Will this work? " + self.a_protected_method
#   end

#   protected

#   def a_protected_method
#     "Yes, I'm protected!"
#   end
# end

#############################################
# POLYMORPHISM
#############################################
# Is ability for data to be represented as many different types. 
# OOP gives us flexibility in using pre-written code for new purposes. 
# We know two types of polymorphism - inheritance and duck typing

#
# Inheritance
# 
# The concept of inheritence in Ruby is where class inherits behaviors of another class
# referred as superclass. This gives programmers the power to define basic classes with
# large reusabilty to and smaller subclasses for more detailed behavior.

#
# DUCK TYPING
#############################################
# The idea is what an object can do rather what it actually is, what we mean
# is that we check if it can do something and not by checking its state

# Duck typing is a programming method that allows any object to be passed into
# a method that has the method signatures expected in order to run. 
# In short, it's not important what an object is, rather what it does. 
# Objects of different types can respond to the same messages as long as 
# they have the specific method behavior. It solves the certain design qualms 
# such as large cases statements and dot methods such as .is_a or .respond_to? 
# that can potentially cause software rot. Essentially allowing your code 
# to rely on public interfaces rather than object types allows for 
# flexibility and change over time.


#
# Modules
#
# Modules are similar to classes in that they contain shared behavior.
# But you cannot create an object with Module. A module is just a piece of code
# which we include in class and that is why we call it mixin. After mixing in a module
# the behaviors declared in that module are available to the class and its objects.
# Use case - mixin or the other is for namespacing which means that we organize similar classes
# under one group

# Namespacing example

# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end
# end

# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
# buddy.speak('Arf!')           # => "Arf!"
# kitty.say_name('kitty')       # => "kitty"


#############################################
# OBJECTS
#############################################
# Ruby defines the atributes/states and behaviors of its objects in classes.
# Atributes are state of object (which data it have)
# Behaviors are what object is capalbe of doing
# Class is an object where we defined what it should be made of and what it should be able to do
# Instantiation  is the workflow of creating a new object or instance from a class. 
# 

#############################################
# CLASSES AND OBJECTS
#############################################
# Initialize method is called everytime we create a new object
# Instance variables are variables that store a state of each object and they are not shared
# between eachother.
# Instance methods are methods that we can call on this objects.
# Class variables are global variables which we can access from any object of that class


#############################################
# How do you declare and use a constructor in Ruby? 
# Use a code example to demonstrate the use of a constructor.
#############################################
# In Ruby we refer to the initialize method as a constructor,
# because it gets triggered whenever we create a new object.


#############################################
# SELF
#############################################
# We can refer to class methods, instance methods
# using self inside instance methods it will refer to an object
# using self outside instance methods it will refer to a class to define class methods


#############################################
# SUPER
#############################################
# Ruby provides us with a built-in function called super that allows us to
# call methods up the inheritance hierarchy. When you call super from within a method,
# it will search the inheritance hierarchy for a method by the same name and then invoke it. 
