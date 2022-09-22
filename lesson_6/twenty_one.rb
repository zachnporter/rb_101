SUITS = %w(Hearts Diamonds Clubs Spades)
CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
TARGET_WINS = 3
TARGET_SCORE = 21

def prompt(string)
  puts "=> #{string}"
end

def print_spacer
  prompt "-----------------------"
end

def enter_to_deal
  prompt "Press enter to deal new hand:"
  gets
  system 'clear'
  prompt "Shuffling deck..."
  sleep(1.25)
  prompt "Dealing cards..."
  sleep(1.25)
end

def introduction
  system 'clear'
  prompt "Welcome to Twenty-One!"
  sleep(1)
  read_rules?
end

def end_game
  system 'clear'
  prompt "Thank you for playing Twenty-One!"
  sleep(1)
  prompt "Goodbye!"
  sleep(1)
end

def read_rules?
  loop do
    prompt "Would you like to read the rules? (y/n)"
    answer = gets.chomp.downcase
    if answer == 'y'
      display_rules
      break
    elsif answer == 'n'
      break
    end
    prompt "Please make a valid selection"
  end
end

def display_rules
  system 'clear'
  prompt "How to play:"
  puts <<-RULES
  - You start with a normal 52-card deck
  - The goal of Twenty-One is to try to get as close to #{TARGET_SCORE} as possible,
    without going over. If you go over #{TARGET_SCORE}, it's a "bust" and you lose.
  - Both participants are initially dealt 2 cards. You can see your 2 cards,
    but can only see one of the dealer's cards.
  - The player closest to #{TARGET_SCORE}, without going over, wins.
  - If both hands are equal in value, it's a draw.
  - First to win #{TARGET_WINS} hand(s) is the Twenty-One champion!
    RULES
end

def initialize_deck
  deck = []

  SUITS.each do |suit|
    CARDS.each do |card|
      deck << [suit, card]
    end
  end

  deck
end

def deal_hand(deck)
  deck.pop(2)
end

def draw_card(deck, hand)
  hand << deck.pop
end

def hand_values(hand)
  hand.map { |value| value[1] }
end

def join_and(hand_values)
  if hand_values.size == 2
    hand_values.join(' and ')
  else
    hand_values[-1] = "and #{hand_values[-1]}"
    hand_values.join(', ')
  end
end

def hand_total(hand)
  values = hand_values(hand)
  total = 0

  values.each do |value|
    total += if value == 'A'
               11
             elsif value =~ /[JQK]/
               10
             else
               value.to_i
             end
  end

  values.select { |value| value == 'A' }.count.times do
    total -= 10 if total > TARGET_SCORE
  end

  total
end

def busted?(hand)
  hand_total(hand) > TARGET_SCORE
end

def display_cards(player_hand, dealer_hand)
  player_cards = join_and(hand_values(player_hand))
  dealer_cards = join_and(hand_values(dealer_hand))

  if dealer_hand.size == 2
    prompt "Dealer has: #{dealer_hand[0][1]} and unknown card"
  else
    prompt "Dealer has: #{dealer_cards} (#{hand_total(dealer_hand)})"
  end

  prompt "You have: #{player_cards} (#{hand_total(player_hand)})"
end

def player_turn(deck, player_hand, dealer_hand)
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    answer = gets.chomp.downcase

    if answer == 'h'
      hit(deck, player_hand, dealer_hand)
      break if busted?(player_hand)
    elsif answer == 's'
      break
    else
      prompt "Please make a valid selection."
    end
  end
end

def hit(deck, player_hand, dealer_hand)
  system 'clear'
  prompt "You choose to hit!"
  sleep(1.25)
  system 'clear'
  draw_card(deck, player_hand)
  display_cards(player_hand, dealer_hand)
end

def dealer_turn(deck, dealer_hand)
  loop do
    cards = join_and(hand_values(dealer_hand))
    prompt "Dealer has: #{cards} (#{hand_total(dealer_hand)})"
    sleep(1.25)

    break if hand_total(dealer_hand) >= 17

    prompt "Dealer hits!"
    draw_card(deck, dealer_hand)
    sleep(1.25)
  end
end

def calculate_result(player_hand, dealer_hand)
  player_score = hand_total(player_hand)
  dealer_score = hand_total(dealer_hand)

  if player_score > TARGET_SCORE
    :player_busted
  elsif dealer_score > TARGET_SCORE
    :dealer_busted
  elsif player_score > dealer_score
    :player
  elsif dealer_score > player_score
    :dealer
  else
    :tie
  end
end

def display_result(result)
  print_spacer
  case result
  when :player_busted then prompt "You busted! Dealer wins!"
  when :dealer_busted then prompt "Dealer busted! You win!"
  when :player   then prompt "You win!"
  when :dealer   then prompt "Dealer wins!"
  when :tie           then prompt "It's a draw!"
  end
  print_spacer
end

def display_score(player_score, dealer_score)
  prompt "Current score: Player - #{player_score}; Dealer - #{dealer_score}"
  print_spacer
end

def winner?(player_score, dealer_score)
  player_score == TARGET_WINS || dealer_score == TARGET_WINS
end

def display_winner(player_score, dealer_score)
  if player_score == TARGET_SCORE
    prompt "Congrats! You are the Twenty-One Champion!"
  elsif dealer_score == TARGET_SCORE
    prompt "Dealer is the Twenty-One Champion! Better luck next time..."
  end
  prompt "Final Score: Player - #{player_score}; Dealer - #{dealer_score}"
end

def play_again?
  loop do
    prompt "Would you like to play again? (y/n)"
    answer = gets.chomp

    case answer
    when 'y' then return true
    when 'n' then return false
    else prompt "Please make a valid selection"
    end
  end
end

introduction

loop do
  player_score = 0
  dealer_score = 0

  loop do
    enter_to_deal
    system 'clear'

    deck = initialize_deck
    deck.shuffle!

    player_hand = deal_hand(deck)
    dealer_hand = deal_hand(deck)

    display_score(player_score, dealer_score)
    system 'clear'
    display_cards(player_hand, dealer_hand)

    loop do
      player_turn(deck, player_hand, dealer_hand)
      break if busted?(player_hand)

      system 'clear'
      prompt "You choose to stay at #{hand_total(player_hand)}"
      sleep(1.25)
      prompt "Dealers turn..."
      sleep(1.25)

      dealer_turn(deck, dealer_hand)
      break if busted?(dealer_hand)

      prompt "Dealer stays at #{hand_total(dealer_hand)}"
      sleep(1.25)

      break
    end

    result = calculate_result(player_hand, dealer_hand)
    display_result(result)
    sleep(1.25)

    if result == :player || result == :dealer_busted
      player_score += 1
    elsif result == :dealer || result == :player_busted
      dealer_score += 1
    end

    if winner?(player_score, dealer_score)
      display_winner(player_score, dealer_score)
      print_spacer
      break
    end

    display_score(player_score, dealer_score)
  end

  sleep(1.25)
  break unless play_again?
  system 'clear'
end

end_game
