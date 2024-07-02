require 'io/console' # for STDIN.getch
require 'pry-byebug'

require_relative 'lib/player'
require_relative 'lib/position'

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

def game_result_check(win_check_array, _curr_player)
  check_hash = {}
  vert_wins = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  hori_wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  diag_wins = [[1, 5, 9], [3, 5, 7]]
  win_possibilities = [vert_wins, hori_wins, diag_wins]
  # create check_hash
  win_check_array.each do |pos_obj|
    check_hash[pos_obj.position_number] = pos_obj.position_state
  end
  if win_check_array.count > 4
    # all win type check
    win_possibilities.each do |win_type| # vert_wins, hori_wins, and diag_wins
      win_type.each do |poss_win|
        x = poss_win[0]
        y = poss_win[1]
        z = poss_win[2]
        if check_hash.include?(x && y && z) && check_hash[x] == check_hash[y] && check_hash[y] == check_hash[z]
            puts "One of the winning combinations contains all the same position state. Player wins!"
            true
        else
          if check_hash.count >= 8
            puts "Tie! Restart the game."
            exit
          else
          false
          end
        end
      end
    end
  else
    false
  end
end

puts "Tic Tac Toe! Player 1 is 'X'. Player 2 is 'O'.
Use any arrow key to navigate. Press Enter to select position. Player 1 goes first."
puts board_array.join

# Single player turn
curr_player = 0
win_check_array = []
while game_result_check(win_check_array, curr_player) != true
  current_position = 0
  player_input = ' '
  while player_input != "\r"
    player_input = STDIN.getch
    next unless player_input == "\e"

    case current_position
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
  all_positions.delete_at(current_position)
  # resets position
  current_position = 0
  # switch player
  if all_players[curr_player].player_side == 'X'
    curr_player = 1
  elsif all_players[curr_player].player_side == 'O'
    curr_player = 0
  end
  # shows board with the opposing, next player
  all_positions[current_position].position_state = all_players[curr_player].player_side
  puts ['_', pos_one.position_state, '_', '|', '_', pos_two.position_state, '_', '|', '_', pos_three.position_state, '_', "\n",
        '_', pos_four.position_state, '_', '|', '_', pos_five.position_state, '_', '|', '_', pos_six.position_state, '_', "\n",
        ' ', pos_seven.position_state, ' ', '|', ' ', pos_eight.position_state, ' ', '|', ' ', pos_nine.position_state, ' '].join
end
