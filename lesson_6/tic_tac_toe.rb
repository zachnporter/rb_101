INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
]

def prompt(msg)
  puts "=> #{msg}"
end

def game_introduction
  system 'clear'
  prompt "Welcome to Tic Tac Toe!"
  sleep(1)

  prompt "Would you like to read the rules? (y/n)"
  answer = gets.chomp
  display_rules if answer.downcase.start_with?('y')
end

def display_rules
  system 'clear'
  prompt "Rules:"
  puts "- Tic Tac Toe is a 2 player game played on a 3x3 board"
  puts "- Each player takes a turn and marks a square on the board"
  puts "- First player to reach 3 squares in a row, including diagonals, wins"
  puts "- If no player has 3 squares in a row, then the game is a tie"
  puts "- First to 5 wins is champion!"
  prompt "Press Enter to begin:"
  gets
end

def who_goes_first?
  system 'clear'
  prompt "Who goes first? (u)ser or (c)omputer?"
  loop do
    answer = gets.chomp.downcase

    if answer.start_with?('u')
      return 'user'
    elsif answer.start_with?('c')
      return 'computer'
    end

    system 'clear'
    prompt "Please make a valid selection: (u)ser or (c)omputer?"
  end
end

def start_match(current_player)
  system 'clear'
  prompt "#{current_player.capitalize} will go first! Press enter to begin:"
  gets
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  system 'clear'
  prompt "You're '#{PLAYER_MARKER}'. Computer is '#{COMPUTER_MARKER}'"
  puts ""
  puts "1    |2    |3    "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "_____|_____|_____"
  puts "4    |5    |6    "
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}   "
  puts "_____|_____|_____"
  puts "7    |8    |9    "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
  puts "     |     |     "
  puts ""
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

def place_piece!(board, current_player)
  if current_player == 'user'
    player_placement!(board)
  elsif current_player == 'computer'
    computer_placement!(board)
  end
end

def alternate_player(current_player)
  if current_player == 'user'
    'computer'
  elsif current_player == 'computer'
    'user'
  end
end

def player_placement!(board)
  square = ''

  loop do
    prompt "Please choose a square (#{joinor(empty_squares(board))}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)

    display_board(board)
    prompt "Sorry, not a valid selection."
  end

  board[square] = PLAYER_MARKER
end

def computer_placement!(board)
  square = winning_square(board, COMPUTER_MARKER)

  if !square
    square = winning_square(board, PLAYER_MARKER)
  end

  square = 5 if !square && empty_squares(board).include?(5)

  square = empty_squares(board).sample if !square

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
  player_score == 5 || computer_score == 5
end

# rubocop:disable Metrics/MethodLength
def display_champion(player_score, computer_score)
  if player_score == 5
    puts "------------------------"
    sleep(1)
    prompt "You are the Tic Tac Toe Champion!"
    sleep(1.5)
    prompt "Congrats!!!"
    sleep(1.5)
    puts "------------------------"
  elsif computer_score == 5
    puts "------------------------"
    sleep(1)
    prompt "Computer is the Tic Tac Toe Champion!"
    sleep(1.5)
    prompt "Better luck next time!"
    sleep(1.5)
    puts "------------------------"
  end
end
# rubocop:enable Metrics/MethodLength

def play_again?
  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp
  answer.downcase.start_with?('y')
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

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if winner?(board) || tie?(board)
    end

    display_board(board)

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
