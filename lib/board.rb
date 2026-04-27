class Board
  attr_accessor :user_guesses_record, :feed_back_record

  def initialize(user_guesses_record = [], feed_back_record = [])
    @user_guesses_record = user_guesses_record
    @feed_back_record = feed_back_record
  end

  def self.create_board
    Board.new
  end

  def show_board(round)
    system("clear")
    if round > 0
      puts "\n------ Mastermind - The Odin Project --------"
      @user_guesses_record.zip(@feed_back_record).each_with_index do |(guess, feedback), index|
        puts "Round #{index + 1}: [ #{guess.join(' ').colorize(:blue)} ] - Feedback: [ #{feedback ? feedback.join(' ') : '....'} ]"
      end
      puts "---------------------------------------------\n"
    end
  end
end
