INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
]
TARGET_WINS = 1

def prompt(msg)
  puts "=> #{msg}"
end

def game_introduction
  system 'clear'
  prompt "Welcome to Tic Tac Toe!"
  sleep(1)

  loop do
    prompt "Would you like to read the rules? (y/n)"
    answer = gets.chomp

    if answer.downcase == 'y'
      display_rules
      break
    elsif answer.downcase == 'n'
      break
    end

    system 'clear'
    prompt "Please make a valid selection."
  end
end

def display_rules
  system 'clear'
  prompt "Rules:"
  puts <<-RULES
  - Tic Tac Toe is a 2 player game played on a 3x3 board
  - Each player takes a turn and marks a square on the board
  - First player to reach 3 squares in a row, including diagonals, wins
  - If no player has 3 squares in a row, then the game is a tie
  - First to #{TARGET_WINS} wins is champion!
  RULES
  prompt "Press Enter to begin:"
  gets
end

def who_goes_first?
  system 'clear'
  loop do
    prompt "Who goes first? (u)ser or (c)omputer?"
    answer = gets.chomp.downcase

    if answer.start_with?('u')
      return 'user'
    elsif answer.start_with?('c')
      return 'computer'
    end

    system 'clear'
    prompt "Please make a valid selection."
  end
end

def start_match(current_player)
  system 'clear'
  prompt "#{current_player.capitalize} will go first! Press enter to begin:"
  gets
end

# rubocop:disable Metrics/AbcSize
def display_board(board, squares)
  system 'clear'
  puts <<~BOARD
  You're '#{PLAYER_MARKER}'. Computer is '#{COMPUTER_MARKER}'
  
  #{squares[0]}    |#{squares[1]}    |#{squares[2]}    
    #{board[1]}  |  #{board[2]}  |  #{board[3]}  
  _____|_____|_____
  #{squares[3]}    |#{squares[4]}    |#{squares[5]}    
    #{board[4]}  |  #{board[5]}  |  #{board[6]}   
  _____|_____|_____
  #{squares[6]}    |#{squares[7]}    |#{squares[8]}    
    #{board[7]}  |  #{board[8]}  |  #{board[9]}  
       |     |     
  
  BOARD
end
# rubocop:enable Metrics/AbcSize

def display_score(player_score, computer_score)
  prompt "Score: 'X' - #{player_score}; 'O' - #{computer_score}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_squares
  ('1'..'9').to_a
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def winning_square(board, marker)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(marker) == 2 &&
       board.values_at(*line).count(INITIAL_MARKER) == 1
      return line.select { |num| board[num] == INITIAL_MARKER }.sample
    end
  end

  nil
end

def joinor(arr, delimeter = ', ', word = 'or')
  case arr.size
  when 1 then arr[0]
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimeter)
  end
end

def place_piece!(board, squares, current_player)
  if current_player == 'user'
    player_placement!(board, squares)
  elsif current_player == 'computer'
    computer_placement!(board, squares)
  end
end

def alternate_player(current_player)
  if current_player == 'user'
    'computer'
  elsif current_player == 'computer'
    'user'
  end
end

def player_placement!(board, squares)
  square = ''

  loop do
    prompt "Please choose a square (#{joinor(empty_squares(board))}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)

    display_board(board, squares)
    prompt "Sorry, not a valid selection."
  end

  squares[square - 1] = ' '
  board[square] = PLAYER_MARKER
end

def computer_placement!(board, squares)
  square = winning_square(board, COMPUTER_MARKER)

  if !square
    square = winning_square(board, PLAYER_MARKER)
  end

  square = 5 if !square && empty_squares(board).include?(5)

  square = empty_squares(board).sample if !square

  squares[square - 1] = ' '
  board[square] = COMPUTER_MARKER
end

def tie?(board)
  empty_squares(board).empty?
end

def winner?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if line.all? { |num| board[num] == PLAYER_MARKER }
      return 'Player'
    elsif line.all? { |num| board[num] == COMPUTER_MARKER }
      return 'Computer'
    end
  end

  nil
end

def champion?(player_score, computer_score)
  player_score == TARGET_WINS || computer_score == TARGET_WINS
end

def display_champion(player_score, computer_score)
  if player_score == TARGET_WINS
    player_wins
  elsif computer_score == TARGET_WINS
    computer_wins
  end
end

def player_wins
  puts "------------------------"
  sleep(1)
  prompt "You are the Tic Tac Toe Champion!"
  sleep(1.5)
  prompt "Congrats!!!"
  sleep(1.5)
  puts "------------------------"
end

def computer_wins
  puts "------------------------"
  sleep(1)
  prompt "Computer is the Tic Tac Toe Champion!"
  sleep(1.5)
  prompt "Better luck next time!"
  sleep(1.5)
  puts "------------------------"
end

def play_again?
  loop do
    prompt("Do you want to play again? (y/n)")
    answer = gets.chomp

    if answer.downcase == 'y'
      return true
    elsif answer.downcase == 'n'
      return false
    end

    # system 'clear'
    prompt "Please make a valid selection."
  end
end

game_introduction

loop do
  player_score = 0
  computer_score = 0
  next_round = 1

  starting_player = who_goes_first?
  current_player = starting_player
  start_match(starting_player)

  loop do
    board = initialize_board
    available_squares = initialize_squares

    loop do
      display_board(board, available_squares)
      place_piece!(board, available_squares, current_player)
      current_player = alternate_player(current_player)
      break if winner?(board) || tie?(board)
    end

    display_board(board, available_squares)

    if winner?(board)
      prompt "#{detect_winner(board)} won!"

      case detect_winner(board)
      when 'Player'   then  player_score += 1
      when 'Computer' then  computer_score += 1
      end
    else
      prompt "It's a tie!"
    end

    display_score(player_score, computer_score)

    break if champion?(player_score, computer_score)

    next_round += 1
    prompt "Press enter to begin round #{next_round}!"
    gets
  end

  display_champion(player_score, computer_score)
  break unless play_again?
end

prompt "Thank you for playing! Goodbye!"
