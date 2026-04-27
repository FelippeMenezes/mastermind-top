require_relative 'lib/board'
require_relative 'lib/computer'
require_relative 'lib/match'
require_relative 'lib/player'

player = Player.new
computer = Computer.create_computer
board = Board.create_board
match = Match.new(player, computer, board)

match.start_game

