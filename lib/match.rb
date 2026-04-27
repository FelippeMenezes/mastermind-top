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
    puts "Welcome! Let's play a game of Mastermind!"
    @player.ask_player_name
    @computer = Computer.create_computer
    @computer.computer_introduce
    @computer.create_secret_code
    @match_secret_code = @computer.secret_code
    @board.show_board(round)

    while @player.round_guess != @match_secret_code && @round < 15
      @round += 1
      @player.ask_player_guess
      @board.user_guesses_record << @player.round_guess
      @feed_back = ["X", "O", "#", "$"].sample(4) #To do
      @board.feed_back_record << @feed_back
      @board.show_board(round)
    end
    if @player.round_guess == @match_secret_code
      puts "Congrats! The secret code was #{@match_secret_code.join(" ")}!"
    else
      puts "You tried! Good luck next time!"
    end
  end
end

