class Board
  attr_accessor :user_history_guesses, :feed_back_history

  def initialize(user_history_guesses = [], feed_back_history = [])
    @user_history_guesses = user_history_guesses
    @feed_back_history = feed_back_history
  end

  def self.create_board
    Board.new
  end

  def show_board
    p @user_history_guesses unless @user_history_guesses == []
    p @feed_back_history unless @feed_back_history == []
  end
end
