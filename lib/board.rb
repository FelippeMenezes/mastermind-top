class Board
  attr_accessor :secret_code, :user_guess, :round, :feed_back

  def initialize(secret_code, user_guess, round, feed_back)
    @secret_code = secret_code
    @user_guess = user_guess
    @round = round
    @feed_back = feed_back
  end
end
