class Board
  attr_accessor :user_guess, :feed_back

  def initialize(feed_back: [], user_guess: nil)
    @user_guess = user_guess
    @feed_back = feed_back
  end

  def self.create_board
    Board.new
  end
end
