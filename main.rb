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

#all_positions array is for movement (going from one position to the next)
all_positions = [pos_one, pos_two, pos_three, pos_four, pos_five, pos_six, pos_seven, pos_eight]

board_array = ["_",pos_one.position_state,"_","|","_","_","_","|","_","_","_","\n",
"_","_","_","|","_","_","_","|","_","_","_","\n",
" "," "," ","|"," "," "," ","|"," "," "," "]

puts "This is my Tic Tac Toe Game!\n"
puts board_array.join
player_input = STDIN.getch

if player_input == "\n"
  puts "Selection"
  #player selection is a permanent change to the board until game ends
  #(when board is destructively modified do a win condition check)
end
if player_input == "\e"
  puts all_positions[0].position_state
  #player movement is a non-destructive change
  #(reverses the previous position's state and changes the moved to position's state)
  #1-6 logic
  #7-9 logic
end



