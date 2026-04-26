class Match
  attr_accessor :player, :computer, :board

  def initialize(player, computer, board)
    @player = player
    @computer = computer
    @board = board
  end

  def start_match
    play_match = true
    puts "Welcome! Let's play a game of Mastermind!"
    while play_match = true && @player.round_guess != @board.match_secret_code
      @player.ask_player_guess
      @board.user_guess = @player.round_guess
    end
    puts "You won!"
  end
end

