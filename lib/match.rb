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
    @player.ask_player_name
    @computer = Computer.create_computer
    @computer.computer_introduce
    @computer.create_secret_code
    @match_secret_code = @computer.secret_code
    @board.show_board(round)

    while @player.round_guess != @match_secret_code && round < 15
      @round += 1
      set_player_guess
      set_feed_back
      @board.show_board(round)
    end
    show_match_result
  end

  private

  def show_match_result
    puts @player.round_guess == @match_secret_code ?
    "Congrats! The secret code was #{@match_secret_code.join(' ').colorize(:green)}!" :
    "You tried! The secret code was #{@match_secret_code.join(' ')}. Good luck next time!".colorize(:red)
  end

  def set_feed_back
    p @match_secret_code
    p @round
    guess_digits = @player.round_guess
    secret_digits = @match_secret_code

    exact_matches = 0
    guess_digits.each_with_index do |guess_digit, index|
      secret_digit = secret_digits[index]
      if guess_digit == secret_digit
        exact_matches += 1
      end
    end

    guess_counts = guess_digits.tally
    secret_counts = secret_digits.tally

    total_common = 0
    guess_counts.each do |digit, count|
      if secret_counts.key?(digit)
        total_common += [count, secret_counts[digit]].min
      end
    end

    wrong_position = total_common - exact_matches
    feedback_result = []
    exact_matches.times { feedback_result << "0" }
    wrong_position.times { feedback_result << "X" }

    @board.feed_back_record << feedback_result
  end

  def set_player_guess
    @player.ask_player_guess(@round)
    @board.user_guesses_record << @player.round_guess
  end
end
