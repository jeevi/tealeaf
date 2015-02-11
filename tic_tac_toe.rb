
def print_to_console(msg)
  puts msg
end

def print_column
  print_to_console "     |     |"
end

def print_row
  print_to_console "-----+-----+-----"  
end

def print_row_with_data(x)
  # I have used the variable name x here 
  # for easier printing purposes
  print_to_console "  #{x[0]}  |  #{x[1]}  |  #{x[2]}"
end

def print_into_grid(board)
	
  system("clear")
  board.each do |row_data|
    print_column
    print_row_with_data(row_data) 
    print_column
    print_row
  end
end

def find_the_winner(board)
  row_with_one = board.map{|row| row.uniq.length}
  if idx = row_with_one.index(1); return board[idx][0] end
  transpose_ = board.transpose
  if idx = row_with_one.index(1); return transpose_[idx][0] end
  if transpose_[0][0] == transpose_[1][1] && transpose_[0][0] == transpose_[2][2]
    return transpose_[0][0]
  elsif transpose_[0][2] == transpose_[1][1] && transpose_[0][2] == transpose_[2][0]
    return transpose_[0][2]
  else
    return nil
  end
end

def begin_game
  
  begin
    print_to_console("Would like to play with x or o ? (x/o)")
    user_choice = gets.chomp
  end while user_choice != 'x' && user_choice != 'o'

  user_choice == "x" ? computer_choice = "o" : computer_choice = "x"
  board = Array.new(3).map!{ Array.new(3, " ") }
  available_cells = Array.new(9){|index| index}

  begin
    print_into_grid(board)
    
    while true
      begin
        print_to_console "\n\n Pick a cell number (0-8)\n"
        user_cell_number = gets.chomp
      end while user_cell_number.ord < 48 || user_cell_number.ord > 56
      if available_cells.include?(user_cell_number.to_i); break end
      print_to_console("\n#{user_cell_number} is already taken, pick another\n")
    end 
    
    user_cell_number = user_cell_number.to_i
    available_cells.delete(user_cell_number)
    computer_cell_number = available_cells.sample

    if !computer_cell_number
      winner = find_the_winner(board)
      if winner == user_choice
        print_to_console "\n\nYou won!\n\n"
      elsif winner == computer_choice
        print_to_console "\n\nYou lost!\n\n"
      else
        print_to_console "\n\nits a tie! :|\n\n"
      end
      break
    end

    available_cells.delete(computer_cell_number)
    board[user_cell_number / 3][user_cell_number % 3] = user_choice
    board[computer_cell_number / 3][computer_cell_number % 3] = computer_choice
  end while true
end

begin_game
