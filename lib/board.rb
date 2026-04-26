class Board
  attr_accessor :secret_code, :user_guess, :round, :feed_back

  def initialize(secret_code:, feed_back: [], user_guess: nil, round: 1)
    @secret_code = secret_code
    @user_guess = user_guess
    @round = round
    @feed_back = feed_back
  end
end
