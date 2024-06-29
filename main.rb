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
all_positions = [pos_one, pos_two, pos_three, pos_four, pos_five, pos_six, pos_seven, pos_eight]

board_array = ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
               '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
               ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' ']

puts "This is my Tic Tac Toe Game!\n"
puts board_array.join
BLANK16 = '_'
BLANK79 = ' '

# Single player turn
player_input = ' '
current_position = 0
while player_input != "\r"
  player_input = STDIN.getch
  next unless player_input == "\e"
  if current_position < 9
    current_position += 1
    # (reverses the previous position's state and changes the moved to position's state)
    all_positions[current_position].position_state = player_one.player_side
    all_positions[current_position - 1].position_state = BLANK16
  else
    current_position = 0
  end
  puts ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
        '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
        ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' '].join
  # player movement is a non-destructive change

  # 1-6 logic
  # 7-9 logic
end

#when enter key is pressed this runs
puts 'Next player turn: ' + player_two.player_side
# puts O is pos_two if pos_one is taken
# If player_one selects pos_one to put their "X",
# pos_one is removed from the array so it cannot be changed.
# when board is destructively modified do a win condition check
