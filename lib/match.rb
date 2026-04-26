class Match
  attr_accessor :player, :computer, :board, :match_secret_code, :feed_back, :round

  def initialize(player, computer, board, match_secret_code: [], feed_back: [], round: 0)
    @player = player
    @computer = computer
    @board = board
    @match_secret_code = match_secret_code
    @feed_back = feed_back
    @round = round
  end

  def start_match
    play_match = true
    puts "Welcome! Let's play a game of Mastermind!"
    @player.ask_player_name
    @computer = Computer.create_computer
    @computer.computer_introduce
    @computer.create_secret_code
    @match_secret_code = @computer.secret_code
    @board.show_board

    while play_match = true && @player.round_guess != @match_secret_code
      @round += 1
      @player.ask_player_guess
      @board.user_history_guesses << @player.round_guess
      @board.feed_back_history << @feed_back
      @board.show_board
      p self
    end
    puts "You won!"
  end
end

