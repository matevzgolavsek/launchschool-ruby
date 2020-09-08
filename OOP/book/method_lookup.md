# Ruby method lookup chain

When calling a Ruby method we may not realize there is a lot of stuff happening in the back. One of the most important things is where the method is decleared and how it behave. 

To see this, we call that the Method Lookup.


## Ancestors chain

Method lookup goes through the ancestor chain of an object to find where method is decleared.

Let's start with one of the Ruby built in methods `ancestors` which we call on any class to find out the method lookup chain. With calling this method we will get an array of all superclasses and modules that are included in.

```
module Walk
  def walk
    puts "Walking around the house"
  end
end

class Animal
  include Walk
end

class Cat < Animal
  def speak
    "Meow Meow!"
  end
end

puts Cat.ancestors
```

Output:

```
Cat
Animal
Walk
Object
Kernel
BasicObject
```

We get output of `Cat class ancestors` and that's how the method lookup is ordered. It goes down the chain until the method is found or there are no more places to look.


## Instance Methods chain

Now we know how to see class inheritance and module mixin of our class object. 

But what if we don't know which methods are defined and where?

Here we can help ourselve again with another built in method `instance_methods`. With it we will get an array of all instance methods that are available to the class object.

```
Cat.instance_methods
```

Output:
```
[:speak, :walk, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :instance_variable_set, ...]
```

Be aware that we will get an array of all methods, even those that are inherited from it's ancestors.

What if we want to see only methods that are defined in specific class?

We will use the same `instance_methods` method but we will pass in `false` to it.

```
Cat.instance_methods(false)
```

Output:
```
[:speak]
```

If we do the same on `Animal` class we will get an empty array as it doesn't have any method defined. 

What about module Walk, you ask?

It behaves the same way as `Class`, we can see list of module methods.

```
Walk.instance_methods(false)
```

Output:
```
[:walk]
```

The otherway around is also to check if `Class` or `Module` includes method. 

```
Walk.instance_methods(false).include?(:walk)
```

Output:

```
true
```


## Conclusion

We can see that built in `ancestors` and `instance_methods` methods can be very helpful for method lookup.

With Ancestors chain and inheritance in mind, we need to be careful of method overriding, which is possible as method calling will execute as soon as it finds the first method.



