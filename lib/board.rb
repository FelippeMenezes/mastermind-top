class Board
  attr_accessor :user_history_guesses

  def initialize(user_history_guesses = [])
    @user_history_guesses = user_history_guesses
  end

  def self.create_board
    Board.new
  end

  def show_board
    p @user_history_guesses unless @user_history_guesses == []
  end
end
