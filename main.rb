require_relative 'lib/board'
require_relative 'lib/computer'
require_relative 'lib/match'
require_relative 'lib/player'

player = Player.new
player.ask_player_name

computer = Computer.create_computer
computer.computer_introduce
computer.create_secret_code

board = Board.create_board
board.match_secret_code = computer.create_secret_code

match = Match.new(player, computer, board)
match.start_match

