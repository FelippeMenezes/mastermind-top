# frozen_string_literal: true

# Class to user player
class Player
  attr_accessor :name, :round_guess, :role

  def initialize(name = nil, round_guess = nil, role = nil)
    @name = name
    @round_guess = round_guess
    @role = role
  end

  def ask_player_name
    puts "Welcome! Let's play a game of Mastermind!".colorize(:green)
    puts "What's your name?"
    @name = gets.chomp.capitalize
  end

  def ask_player_role
    x = 'x'
    y = '0'
    puts "Type #{x.colorize(:yellow)} to discover my secret code,
or type #{y.colorize(:yellow)}(zero) if you want me to
discover your secret code?"
    print "Press #{x.colorize(:yellow)} or #{y.colorize(:yellow)} and press Enter => "
    player_role = gets.chomp.downcase
    @role = player_role == 'x'
  end

  def ask_player_guess(round)
    if @role != true
      spinner_player
      guess = computer_strategy
    else
      if round == 1
        first = 'first'
        print "#{@name.colorize(:blue)}, what's your #{first.colorize(:green)} guess? => "
      elsif round == 15
        last = 'last'
        print "#{@name.colorize(:blue)}, what's your #{last.colorize(:red)} guess? => "
      else
        round_string = round.to_s
        print "#{@name.colorize(:blue)}, what's your guess number #{round_string.colorize(:yellow)}? => "
      end
      guess = gets.chomp
    end
    check_player_input(guess, round)
  end

  def ask_player_code
    four_digits = '4 digits'
    range = '1 to 6'
    repetition = 'repetition is allowed'
    puts "Your secret code should have #{four_digits.colorize(:yellow)}.
Each digit ranges from #{range.colorize(:yellow)}, and
#{repetition.colorize(:blue)}."
    print 'Enter your code here. => '
    input = gets.chomp
    check_player_code_input(input)
  end

  private

  def spinner_player
    puts 'I thinking a guess. Give me a few seconds.'.colorize(:blue)
    frames = ['-', '\\', '|', '/']

    5.times do
      frames.each do |frame|
        print "\r#{frame}"
        sleep(0.1)
      end
    end
  end

  def check_player_input(guess, round)
    if guess.match?(/^[1-6]{4}$/)
      @round_guess = string_to_integer(guess)
    else
      puts 'Select just 4 numbers between 1 and 6.'.colorize(:red)
      ask_player_guess(round)
    end
  end

  def check_player_code_input(input)
    if input.match?(/^[1-6]{4}$/)
      string_to_integer(input)
    else
      puts 'Select just 4 numbers between 1 and 6.'.colorize(:red)
      ask_player_code
    end
  end

  def string_to_integer(string_number)
    string_number.chars.map(&:to_i)
  end

  def computer_strategy
    4.times.map { rand(1..6) }.join # To do
  end
end
