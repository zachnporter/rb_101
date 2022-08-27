VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}

WINNING_MOVES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['paper', 'spock']
}

def print_spacer
  puts "-------------------------------------------"
end

def prompt(message)
  puts "=> #{message}"
end

def display_rules?
  prompt("Would you like to read the rules? (y/n)")
  answer = gets.chomp
  display_rules if answer.downcase.start_with?('y')
end

def display_rules
  system 'clear'
  prompt("Rules:")
  puts "The game is an expansion on the game Rock, Paper, Scissors."
  puts "- Each player picks a variable"
  puts "- The winner is decided by comparing the two variable (see below)"
  puts "- In a tie, the process is repeated until a winner is found"
  prompt("Remember:")
  puts "- Scissors cuts paper. Paper covers rock."
  puts "- Rock crushes lizard. Lizard poisons Spock."
  puts "- Spock smashes scissors. Scissors decapitates lizard."
  puts "- Lizard eats paper. Paper disproves Spock."
  puts "- Spock vaporizes rock. Rock crushes scissors."
end

def enter_to_continue
  prompt("Press enter to continue:")
  gets
end

def win?(first, second)
  WINNING_MOVES[first].include?(second)
end

def update_score(first, second)
  win?(first, second) ? 1 : 0
end

def check_for_winner(score1, score2)
  if score1 == 3
    sleep(1.25)
    print_spacer
    prompt("*** You are the grand winner! ***")
  elsif score2 == 3
    sleep(1.25)
    print_spacer
    prompt("*** Computer is the grand winner! ***")
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_score(score1, score2)
  print_spacer
  prompt("Current Score: Player - #{score1}; Computer - #{score2}")
  print_spacer
end

def play_again?
  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

system 'clear'
prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("First to 3 is grand champion!")
display_rules?
enter_to_continue

loop do
  system 'clear'
  player_score = 0
  computer_score = 0

  loop do
    choice = ''

    loop do
      prompt("Choose one:")
      VALID_CHOICES.each { |key, value| puts "- '#{key}' for #{value}" }
      choice = gets.chomp.downcase

      if VALID_CHOICES.include?(choice)
        choice = VALID_CHOICES[choice]
        break
      else
        prompt("That's not a valid choice.")
        print_spacer
      end
    end

    computer_choice = VALID_CHOICES.values.sample

    system 'clear'
    prompt("You chose #{choice}, computer chose #{computer_choice}")
    display_results(choice, computer_choice)

    player_score += update_score(choice, computer_choice)
    computer_score += update_score(computer_choice, choice)

    check_for_winner(player_score, computer_score)
    break if player_score == 3 || computer_score == 3

    display_score(player_score, computer_score)
    enter_to_continue

    system 'clear'
    display_score(player_score, computer_score)
  end

  prompt("Final Score: Player - #{player_score}; Computer - #{computer_score}")
  print_spacer
  sleep(1.5)
  break unless play_again?
  print_spacer
end

prompt("Thank you for playing. Goodbye!")
