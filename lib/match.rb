class Match
  attr_accessor :player, :computer, :board

  def initialize(player, computer, board)
    @player = player
    @computer = computer
    @board = board
  end

  def start_match
    puts "Welcome! Let's play a game of Mastermind!"
  end
end

