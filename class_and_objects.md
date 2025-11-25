Day 1 – Ruby Foundations (Beginner Notes)

Goal of Day 1

Understand the basics of Ruby:
- What is an Object
- What is a Class
- What is a Method
- How Ruby finds a method (method lookup)

1. What Is an Object?
Everything in Ruby is an object.
Examples:
5.class => Integer
"hi".class => String
true.class => TrueClass

2. What Is a Class?
A class is a blueprint used to create objects.
Example:
class Person
end

Objects:
p1 = Person.new
p2 = Person.new

3. What Is a Method?
A method is an action or behavior inside a class.
Example:
class Person
  def speak
    "Hello!"
  end
end

p = Person.new
p.speak  #=> "Hello!"

4. How Ruby Finds a Method (Method Lookup Path)
Ruby searches in this order:
1. Object itself
2. Class
3. Included modules
4. Parent class
5. Object
6. BasicObject

If not found → NoMethodError.

5. Simple Example
class Dog
  def bark
    "woof!"
  end
end

d = Dog.new
d.bark  #=> "woof!"


Ruby Method Lookup Chain – Detailed Notes
Introduction
When you call a method like `p.speak`, Ruby searches for the method in a specific order. This order is known as the method lookup path.
1. Singleton Class (Eigenclass of the Object)
Ruby first checks if the method is defined only for that specific object.

Example:
def p.speak
  "I am only for this object"
end

This has the highest priority.
2. The Class of the Object
If not found in the singleton class, Ruby checks the class the object was created from.

Example:
class Person
  def speak
    "I am a Person"
  end
end
3. Modules Included in the Class
If not found in the class, Ruby checks the modules included in that class.

Example:
module Talker
  def speak
    "Speaking from Talker"
  end
end

class Person
  include Talker
end
4. Parent Class (Superclass)
If not found in class/modules, Ruby checks the parent class.

Example:
class Animal
  def speak
    "Animal sound"
  end
end

class Person < Animal
end
5. Modules Included in Parent Class
Ruby checks included modules in the parent class next.
6. Object Class
Ruby checks Object class next. Provides common methods like to_s, class, inspect.
7. Kernel Module
Kernel is included in Object and provides methods like puts, print, system.
8. BasicObject
Root class with minimal methods (==, !, __send__). If Ruby reaches here and still doesn't find the method, it raises NoMethodError.
NoMethodError
If Ruby cannot find the method anywhere in the lookup chain, it raises:
NoMethodError: undefined method
How to See Lookup Chain
Use `.ancestors` to print the method lookup order:
Person.ancestors

Example output:
[Person, Talker, Animal, Object, Kernel, BasicObject]
Final Lookup Order (Summary)
1. Singleton class of the object
2. Class of the object
3. Modules included in the class
4. Parent class
5. Modules in the parent class
6. Object
7. Kernel
8. BasicObject


