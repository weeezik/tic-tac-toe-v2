require 'io/console' #for STDIN.getch

class Position
  def initialize(position_state)
    @position_state = position_state
  end
  attr_accessor :position_state
end

pos_one = Position.new("X")
pos_two = Position.new("_")
pos_three = Position.new("_")
pos_four = Position.new("_")
pos_five = Position.new("_")
pos_six = Position.new("_")
pos_seven = Position.new(" ")
pos_eight = Position.new(" ")
pos_nine = Position.new(" ")

class Player
  def initialize(player_side)
    @player_side = player_side
  end
  attr_accessor :player_side
end

player_one = Player.new("X")
player_two = Player.new("O")

#all_positions array is for movement (going from one position to the next)
all_positions = [pos_one, pos_two, pos_three, pos_four, pos_five, pos_six, pos_seven, pos_eight]

board_array = ["_",pos_one.position_state,"_","|","_",pos_two.position_state,"_","|","_",pos_three.position_state,"_","\n",
"_",pos_four.position_state,"_","|","_",pos_five.position_state,"_","|","_",pos_six.position_state,"_","\n",
" ",pos_seven.position_state," ","|"," ",pos_eight.position_state," ","|"," ",pos_nine.position_state," "]

puts "This is my Tic Tac Toe Game!\n"
puts board_array.join
BLANK16 = "_"
BLANK79 = " "


#Player turn begins
player_input = STDIN.getch
current_position = 0
if player_input == "\n"
  puts "Selection"
  #player selection is a permanent change to the board until game ends
  #(when board is destructively modified do a win condition check)
end
if player_input == "\e"
  if current_position < 9
    current_position += 1
    all_positions[current_position].position_state = player_one.player_side
    all_positions[current_position-1].position_state = BLANK16
    puts "First position is in this state: " + pos_one.position_state
    puts "Second position is in this state: " + pos_two.position_state
  else 
    current_position = 0
  end
  puts ["_",pos_one.position_state,"_","|","_",pos_two.position_state,"_","|","_",pos_three.position_state,"_","\n",
  "_",pos_four.position_state,"_","|","_",pos_five.position_state,"_","|","_",pos_six.position_state,"_","\n",
  " ",pos_seven.position_state," ","|"," ",pos_eight.position_state," ","|"," ",pos_nine.position_state," "].join
  #player movement is a non-destructive change
  #(reverses the previous position's state and changes the moved to position's state)
  #1-6 logic
  #7-9 logic
end





