class Match
  attr_accessor :match_secret_code, :player, :computer, :board, :round

  def initialize(player, computer, board, match_secret_code: [], round: 1)
    @match_secret_code = match_secret_code
    @player = player
    @computer = computer
    @board = board
    @round = round
  end


  def start_match
    play_match = true
    puts "Welcome! Let's play a game of Mastermind!"
    @player.ask_player_name
    @computer = Computer.create_computer
    @computer.computer_introduce
    @computer.create_secret_code

    while play_match = true && @player.round_guess != @match_secret_code

      @player.ask_player_guess
      @board.user_guess = @player.round_guess

      p self
    end
    puts "You won!"
  end
end

