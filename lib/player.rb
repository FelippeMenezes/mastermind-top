class Player
  attr_accessor :name, :round_guess

  def initialize(name = nil, round_guess = nil)
    @name = name
    @round_guess = round_guess
  end

  def ask_player_name
    puts "Welcome! Let's play a game of Mastermind!".colorize(:green)
    puts "What's your name?"
    @name = gets.chomp
  end

  def ask_player_guess(round)
    if round == 1
      first = "first"
      print "#{@name.colorize(:green)}, what's your #{first.colorize(:blue)} guess? => "
    elsif round == 15
      last = "last"
      print "#{@name.colorize(:green)}, what's your #{last.colorize(:red)} guess? => "
    else
      round_string = "#{round}"
      print "#{@name.colorize(:green)}, what's your guess number #{round_string.colorize(:yellow)}? => "
    end
    guess = gets.chomp
    check_player_input(guess, round)
  end

  private

  def check_player_input(guess, round)
    if guess.match?(/^[1-6]{4}$/)
      @round_guess = string_to_integer(guess)
    else
      puts "Select just 4 numbers between 1 and 6.".colorize(:red)
      ask_player_guess(round)
    end
  end

  def string_to_integer(string_number)
    string_number.chars.map(&:to_i)
  end
end
