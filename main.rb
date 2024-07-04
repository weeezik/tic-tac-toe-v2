require 'io/console' # for STDIN.getch
require 'pry-byebug'

require_relative 'lib/player'
require_relative 'lib/position'
require_relative 'lib/game-check'

pos_one = Position.new('X', 1)
pos_two = Position.new('_', 2)
pos_three = Position.new('_', 3)
pos_four = Position.new('_', 4)
pos_five = Position.new('_', 5)
pos_six = Position.new('_', 6)
pos_seven = Position.new(' ', 7)
pos_eight = Position.new(' ', 8)
pos_nine = Position.new(' ', 9)

player_one = Player.new('X')
player_two = Player.new('O')

# all_positions array is for movement (going from one position to the next)
all_positions = [pos_one, pos_two, pos_three, pos_four, pos_five, pos_six, pos_seven, pos_eight, pos_nine]
# all_players array is for switching turns
all_players = [player_one, player_two]

board_array = ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
               '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
               ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' ']
BLANK16 = '_'
BLANK79 = ' '

puts "Tic Tac Toe! Player 1 is 'X'. Player 2 is 'O'.
Use any arrow key to navigate. Press Enter to select position. Player 1 goes first."
puts board_array.join

# Single player turn
curr_player = 0
win_check_array = []
while game_result_check(win_check_array, curr_player) != true
  current_position = 0
  player_input = ' '
  # max_num = 7
  while player_input != "\r"
    player_input = STDIN.getch
    next unless player_input == "\e"
    case current_position # this is where to alter to prevent looping errors
    when (0..5)
      current_position += 1
      all_positions[current_position].position_state = all_players[curr_player].player_side
      all_positions[current_position - 1].position_state = BLANK16
    when (6..7) # -3..-2 (reverse array positions)
      current_position += 1
      all_positions[current_position].position_state = all_players[curr_player].player_side
      all_positions[current_position - 1].position_state = BLANK79
    else
      current_position = 0
      all_positions[current_position].position_state = all_players[curr_player].player_side
      all_positions[8].position_state = BLANK79
    end

    puts "\n" + ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
                 '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
                 ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' '].join
  end
  # when enter key is pressed this runs
  puts "\n" + 'Next player turn.'
  # removes position selected and sends to win_check_array
  win_check_array.push(all_positions[current_position])
  all_positions.delete_at(current_position) # the function of this line is something to consider to fix board loopability
  # resets position
  current_position = 0
  # switches player
  if all_players[curr_player].player_side == 'X'
    curr_player = 1
  elsif all_players[curr_player].player_side == 'O'
    curr_player = 0
  end
  p "Selected positions: #{win_check_array.count}"
  p "Available positions: #{all_positions.count}"
  # shows board with the opposing, next player
  all_positions[current_position].position_state = all_players[curr_player].player_side
  puts ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
        '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
        ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' '].join
end
puts 'Game end.'
