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
Use arrow keys to navigate. Press Enter to select position. Player 1 goes first..."
puts board_array.join
BLANK16 = '_'
BLANK79 = ' '

# Single player turn
player_input = ' '
current_position = 0
while player_input != "\r"
  player_input = STDIN.getch
  next unless player_input == "\e"
  case current_position
  when (0..5)
    current_position += 1
    all_positions[current_position].position_state = all_players[0].player_side
    all_positions[current_position - 1].position_state = BLANK16
  when (6..7)
    current_position += 1
    all_positions[current_position].position_state = all_players[0].player_side
    all_positions[current_position - 1].position_state = BLANK79
  when current_position = 8
    current_position = 0
    all_positions[current_position].position_state = all_players[0].player_side
    all_positions[8].position_state = BLANK79
  end
  puts ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
        '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
        ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' '].join
end

# when enter key is pressed this runs
puts 'Next player turn.'
all_positions.delete_at(current_position)
current_position = 0
all_positions[current_position].position_state = all_players[1].player_side
puts ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
      '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
      ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' '].join

# puts O in pos_two if pos_one is taken
# If player_one selects pos_one to put their "X",
# pos_one is removed from the array so it cannot be changed.
# when board is destructively modified do a win condition check
