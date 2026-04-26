class Match
  attr_accessor :player, :computer, :board

  def initialize(player, computer, board)
    @player = player
    @computer = computer
    @board = board
  end
end
