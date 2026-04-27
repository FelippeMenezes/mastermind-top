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

  def computer_introduce(player)
    puts "Hello! #{player.name.colorize(:blue)}, my name is #{@name.colorize(:red)}!
I'll be your opponent in this game."
  end

  def create_secret_code
    x = "X"
    y = "0"
    four_digits = "4 digits"
    range = "1 to 6"
    rounds = "15"
    correct_digit = "correct digit"
    correct_position = "correct position"
    wrong_position = "wrong position"
    repetition = "repetition is allowed"
    puts "This secret code consisting
of #{four_digits.colorize(:yellow)}. Each digit ranges from #{range.colorize(:yellow)}, and
#{repetition.colorize(:blue)}. Your objective is to guess
the exact sequence within #{rounds.colorize(:yellow)} rounds.
After each guess, feedback will be provided:
- #{x.colorize(:green)} indicates a #{correct_digit.colorize(:green)} in the #{correct_position.colorize(:green)}
- #{y.colorize(:yellow)} indicates a #{correct_digit.colorize(:green)} in the #{wrong_position.colorize(:red)}
- No symbol means the digit is not present in the code.
   Good luck!"
    code_options = [1, 2, 3, 4, 5, 6]
    4.times do
      @secret_code << code_options.sample
    end
  end
end
