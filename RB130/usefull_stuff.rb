#############################################
# Yield
#############################################
# Yield is a Ruby keyword that calls a block when we use it.
#
# def print_once
#   yield
# end
# print_once { puts "Block is being run" }

#############################################
# Closures
#############################################
# A closure is a general programming concept that allows programmers to save
# a "chunk of code" and execute it at a later time.
#  It's called a "closure" because it's said to bind its surrounding artifacts
# (ie, variables, methods, objects, etc) and build an "enclosure" around
# everything so that they can be referenced when the closure is later executed.

# See https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e for Closure and binding

# Which of the following statements is true when discussing closures?
# 
# A closure lets you save a chunk of code and execute it later.
# You can pass closures around like objects.

# Which of the following actions create a closure in Ruby?
# 
# Passing a block to a method, Creating a Proc object, Creating a lambda

#############################################
# Bindings
#############################################

# What do we mean when we say that a closure creates a binding?
# 
# A closure retains access to variables, constants, and methods that were
# in scope at the time and location you created the closure. 
# It binds some code with the in-scope items.



#############################################
# Writing methods that take blocks
# https://launchschool.com/lessons/c0400a9c/assignments/5a060a20
#############################################

# Which of the following situations is a good use case for writing a method that takes a block?
# 
# To let methods perform some kind of before and after actions
# To defer some implementation code until method invocation


# Which of the following statements about methods that take blocks is true
# 
# Any Ruby method can take an optional block as an implicit parameter. 
# If the method doesn't use the block, the method ignores it.


# Which of the following statements about block parameters and arguments is true?
# 
# You can pass more arguments than the block parameter list shows.
# You can pass fewer arguments than the block parameter list shows. 
# The omitted arguments will be nil.
# You can pass fewer arguments than the block parameter list shows,
# but you can't access the parameters inside the block.



# As we talked about before, a block is how Ruby implements the idea of a closure,
# which is a general computing concept of a "chunk of code" that you can pass around
# and execute at some later time. Think about that: an unnamed "chunk of code" being
# passed around in your codebase. In order for this "chunk of code" to be
# executed later, it must understand the surrounding context from when it
# was initialized. In Ruby, this "chunk of code" or closure is represented by
# a Proc object, a lambda, or a block. Remember that blocks are a form of Proc. 

# The block is an argument to the method call. 

# blocks are one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" to be executed later.
# blocks can take arguments, just like normal methods. But unlike normal methods, it won't complain about wrong number of arguments passed to it.
# blocks return a value, just like normal methods.
# blocks are a way to defer some implementation decisions to method invocation time. It allows method callers to refine a method at invocation time for a specific use case. It allows method implementors to build generic methods that can be used in a variety of ways.
# blocks are a good use case for "sandwich code" scenarios, like closing a File automatically.


# Symbol to proc
# https://launchschool.com/lessons/c0400a9c/assignments/26d715d8
#


#############################################
# Lambda and Proc arity
#############################################
# The rules regarding the number of arguments that you can pass to a block,
# Proc, or lambda in Ruby is called its arity. In Ruby, blocks have
# lenient arity rules, which is why it doesn't complain when you pass
# in different number of arguments; Proc objects and lambdas have different arity rules. 

# Proc is defined Proc.new or proc { } and lambdas are defined lamba {} or -> {}
# Proc return from the current method, while lambdas return from lambda itself
# Procs don't care about the correnct number of argument, while lamdas raise an exceptio
# like methods


#############################################
# TESTING
#############################################

# Test Suite: this is the entire set of tests that accompanies your program or application.
# You can think of this as all the tests for a project.

# Test: this describes a situation or context in which tests are run. 
# For example, this test is about making sure you get an error message after 
# trying to log in with the wrong password. A test can contain multiple assertions.

# Assertion: this is the actual verification step to confirm that the data returned 
# by your program or application is indeed what is expected. You make one or more 
# assertions within a test.


#############################################
# 4 step testing apporach - SEAT 
#############################################

# 1. Set up the necessary objects.
# 2. Execute the code against the object we're testing.
# 3. Assert the results of the execution.
# 4. Tear down and clean up any lingering artifacts.


#############################################
# 5 Internal vs External Iterators
#############################################

# Internal - Its called becase the process and implementation is already defined
# and is hidden from us. Process that that allows us to progress through the collection
# is part of hidden implementation

# External - This iteration behave how the user wants to. Ruby gives us the option to use this
# type of iteration with Enumerator class.
