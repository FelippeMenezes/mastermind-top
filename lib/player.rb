class Player
  attr_accessor :name, :round_guess

  def initialize(name = nil, round_guess = nil)
    @name = name
    @round_guess = round_guess
  end

  def ask_player_name
    puts "What's your name?"
    @name = gets.chomp
  end

  def ask_player_guess
    print "What's your guess? => "
    guess = gets.chomp
    @round_guess = string_to_integer(guess)
  end

  def string_to_integer(string_number)
    string_number.chars.map(&:to_i)
  end
end
