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
    string_number.chars.map do |char|
      case char
      when '0' then 0
      when '1' then 1
      when '2' then 2
      when '3' then 3
      when '4' then 4
      when '5' then 5
      when '6' then 6
      when '7' then 7
      when '8' then 8
      when '9' then 9
      end
    end
    string_number.chars.map(&:to_i)
  end
end
