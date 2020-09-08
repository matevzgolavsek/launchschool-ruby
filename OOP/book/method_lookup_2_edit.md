# Ruby method lookup

When calling a Ruby method we may not realize there is a lot happening in the back. One of the most important things is where the method is declared.

That's why we have a concept called the method lookup. Method lookup is the path that an object takes to invoke a method with the same name as the message that was sent to it.

We start from the receiver(object) and move up the ancestor chain until the message(method) is found. But Ruby allows us to extend singleton classes and mix in modules, which can confuse the mind a little bit.

When we pass a message to an object, Ruby will take a five step journey to look for a method to invoke.


## 1. Methods defined in the object's singleton class (object itself) 

First, it will look into singleton class. By that I mean it will check for singleton method which is a method that is defined on the instance and it is only available to that instance, not other instances of the same class.

```
class Cat
  def speak
    "Meowing from Cat class!"
  end
end

cat_object = Cat.new

def cat_object.speak
  "Meowing from singleton"
end

cat_object.speak #=> "Meowing from singleton"
```

## 2. Modules mixed into singleton class

If a method is not found on the singleton, then the next step we will take is to look in modules that extend our singleton.


```
module SpeakModule
  def speak
    "Meowing from module"
  end
end

class Cat
  def speak
    "Meowing from Cat class!"
  end
end

cat_object = Cat.new
cat_object.extend(SpeakModule)

cat_object.speak #=> "Meowing from module"
```

Be aware, if we are extending multiple modules, the module that is extended last will take precedence: 

```
module SpeakModule
  def speak
    "Meowing from module"
  end
end

module SpeakModule2
  def speak
    "Meowing from second module"
  end
end

class Cat
  def speak
    "Meowing from Cat class!"
  end
end

cat_object = Cat.new
cat_object.extend(SpeakModule)
cat_object.extend(SpeakModule2)

cat_object.speak #=> "Meowing from second module"
```

## 3. Methods defined by the object's class

Usually we don't extend singletons but it is possible. Normally we would start here, with defining methods inside class.

```
class Cat
  def speak
    "Meowing from Cat class!"
  end
end

cat_object = Cat.new

cat_object.speak #=> "Meowing from Cat class!"
```

## 4. Module included into the object's class

If the method doesn't exist in the object class, we will check for mixed in modules if they exist. Similar to extending singleton, the last included module will take precedence:

```
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

cat_object.speak #=> "Meowing from module 2"
```

## 5. Methods defined by the object's superclass

If we can't find a method in our singleton, in our class or in mixed in modules, then we will have to move up the ancestors chain. So we start at methods defined by our superclass, look into modules mixed in that superclass and move to the next superclass, we repeat this until the method is found.

What if the method we are looking for is not found?

By default when we make a new class, we get three inherited superclasses [Object, Kernel, BasicObject]. That way the last method call is method_missing which is defined in BasicObject class, which would raise an error:

```
class Cat
end

cat_object = Cat.new

cat_object.fly #=> NoMethodError: undefined method `fly' for for #<Cat:0x00007fdb7b133a18>
```

## One step to the right, and up

We can also call the behaviour that is described above as "one step to the right, and up", which we can describe as: go right into receivers class (singleton) and then up the ancestors chain. Here is a simple visualisation of it:

```
          BasicObject
              ^
              |
            Kernel
              ^
              |
            Object
              ^
              |
          Parent class Animal
              ^
              |
              Module included by Parent Class Cat
              ^
              |
          Parent class Cat
              ^
              |
          object's class
              ^
              |
obj  ->   obj's singleton_class
``` 

## Conclusion

Understanding the method lookup path is an important concept to grasp once you start writing your own classes. 

It is very important that we know that defining a method with the same name as in superclass will override existing methods. If you’re ever in doubt just remember Ruby has you covered with ancestors method, but remember that order of elements returned is very important.
