def game_result_check(win_check_array, curr_player)
  result = false
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
      break if result == true
      win_type.each do |poss_win|
        x = poss_win[0]; y = poss_win[1]; z = poss_win[2]
        if check_hash.include?(x && y && z) && check_hash[x] == check_hash[y] && check_hash[y] == check_hash[z]
          puts "One of the winning combinations contains all the same position state. Player wins!"
          result = true
          break
        else
          result = false
          next
        end
      end
    end
  else
    result = false
  end
  result
end
