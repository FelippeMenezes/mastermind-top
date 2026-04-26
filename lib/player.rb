class Player
  attr_accessor :name, :guess

  def initialize(name = nil, guess = nil)
    @name = name
    @guess = guess
  end

  def ask_name
    puts "What's your name?"
    @name = gets.chomp
  end
end
