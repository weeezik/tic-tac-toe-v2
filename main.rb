require 'io/console' # for STDIN.getch

class Position
  def initialize(position_state)
    @position_state = position_state
  end
  attr_accessor :position_state
end

pos_one = Position.new('X')
pos_two = Position.new('_')
pos_three = Position.new('_')
pos_four = Position.new('_')
pos_five = Position.new('_')
pos_six = Position.new('_')
pos_seven = Position.new(' ')
pos_eight = Position.new(' ')
pos_nine = Position.new(' ')

class Player
  def initialize(player_side)
    @player_side = player_side
  end
  attr_accessor :player_side
end

player_one = Player.new('X')
player_two = Player.new('O')

# all_positions array is for movement (going from one position to the next)
all_positions = [pos_one, pos_two, pos_three, pos_four, pos_five, pos_six, pos_seven, pos_eight, pos_nine]
# all_players array is for switching turns
all_players = [player_one, player_two]

board_array = ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
               '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
               ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' ']

puts "Tic Tac Toe! Player 1 is 'X'. Player 2 is 'O'.
Use arrow keys to navigate. Press Enter to select position. Player 1 goes first. 
PRESS ENTER TO BEGIN."
puts board_array.join
BLANK16 = '_'
BLANK79 = ' '

def turn_movement(player_input = ' ', current_position, pos_arr, play_arr)
  player_input = STDIN.getch
  return unless player_input == "\e"

  case current_position
  when (0..5)
    return current_position += 1
    pos_arr[current_position].position_state = play_arr[0].player_side
    pos_arr[current_position - 1].position_state = BLANK16
  when (6..7)
    return current_position += 1
    all_positions[current_position].position_state = all_players[0].player_side
    all_positions[current_position - 1].position_state = BLANK79
  when current_position = 8
    return current_position = 0
    all_positions[current_position].position_state = all_players[0].player_side
    all_positions[8].position_state = BLANK79
  else
    puts 'Invalid current_position value.'
  end
  puts "\n" + ['_', pos_arr[0].position_state, '_', '|', '_', pos_arr[1].position_state, '_', '|', '_', pos_arr[2].position_state, '_', "\n",
               '_', pos_arr[3].position_state, '_', '|', '_', pos_arr[4].position_state, '_', '|', '_', pos_arr[5].position_state, '_', "\n",
               ' ', pos_arr[6].position_state, ' ', '|', ' ', pos_arr[7].position_state, ' ', '|', ' ', pos_arr[8].position_state, ' '].join
end

# Single player turn
player_input = ' '
current_position = 0
# while player_input != "\r"
#   turn_movement player_input, current_position,
#                 pos_arr = all_positions, play_arr = all_players
# end
# when enter key is pressed this runs
puts 'Next player turn.'
all_positions.delete_at(current_position) # pos_whatevernumber is removed from array so it cannot be further modified
current_position = 0
all_positions[current_position].position_state = all_players[1].player_side
puts ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
      '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
      ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' '].join
# do a win condition check

#press Enter 
puts "Tic Tac Toe! Player 1 is 'X'. Player 2 is 'O'.
Use arrow keys to navigate. Press Enter to select position. Player 1 goes first. 
PRESS ENTER TO BEGIN."
initial_player_input = STDIN.getch

