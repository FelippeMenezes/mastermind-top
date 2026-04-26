class Board
  attr_accessor :match_secret_code, :user_guess, :round, :feed_back

  def initialize(match_secret_code: [], feed_back: [], user_guess: nil, round: 1)
    @match_secret_code = match_secret_code
    @user_guess = user_guess
    @round = round
    @feed_back = feed_back
  end

  def self.create_board
    Board.new
  end
end
