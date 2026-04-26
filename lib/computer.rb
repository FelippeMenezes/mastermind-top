require 'colorize'

class Computer
  attr_accessor :name

  def initialize (name = nil)
    @name = name
  end

  def self.create_computer
    names = ["GPTo", "ClaudIO", "MarI.A."]
    new(names.sample)
  end

  def computer_introduce
    puts "Hello, my name is #{@name.colorize(:green)}, and I'll be your opponent in this game."
  end
end
