require 'colorize'

class Computer
  attr_accessor :name, :secret_code

  def initialize (name = nil, secret_code = [])
    @name = name
    @secret_code = secret_code
  end

  def self.create_computer
    names = ["GPTo", "ClaudIO", "MarI.A."]
    new(names.sample)
  end

  def computer_introduce
    puts "Hello, my name is #{@name.colorize(:red)}, and I'll be your opponent in this game."
  end

  def create_secret_code
    code_options = [1, 2, 3, 4, 5, 6]
    4.times do
      @secret_code << code_options.sample
    end
  end
end
