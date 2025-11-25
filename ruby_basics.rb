# ruby_basics.rb
module Greeting
  def greet
    "hello from #{self.class}"
  end
end

class Person
  include Greeting

  def initialize(name)
    @name = name.freeze
  end

  def name
    @name
  end

  def self.description
    "Person class"
  end
end

p = Person.new("Abhishek")
puts p.greet
puts Person.description
