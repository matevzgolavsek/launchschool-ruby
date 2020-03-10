require 'pry'

DECK = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
DECK_SYMBOLS = ['H', 'D', 'S', 'C']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []
  DECK.each do |card_val|
    DECK_SYMBOLS.each do |card_sym|
      deck << [card_sym, card_val]
    end
  end
  deck
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def initialize_player_cards(deck)
  player_cards = []

  2.times do
    random = deck.sample
    player_cards << random

    deck.delete_if do |x|
      x == random
    end
  end

  return player_cards, deck
end

def initialize_dealer_cards(deck)
  dealer_cards = []

  2.times do
    random = deck.sample
    dealer_cards << random

    deck.delete_if do |x|
      x == random
    end
  end

  return dealer_cards, deck
end

def hit_card(cards, deck)
  random_card = deck.sample
  cards << random_card

  deck.delete_if do |x|
    x == random_card
  end

  return cards, deck
end

def busted?(cards)
  total(cards) > 21
end

deck = initialize_deck
player_cards, deck = initialize_player_cards(deck)
dealer_cards, deck = initialize_dealer_cards(deck)

loop do
  break if busted?(player_cards)

  prompt "#{total(player_cards)} is your current total"

  prompt "hit or stay?"
  answer = gets.chomp

  break if answer == 'stay'

  player_cards, deck = hit_card(player_cards, deck)
end

if busted?(player_cards)
  # probably end the game? or ask the user to play again?
  prompt "You lost! Total #{total(player_cards)}"
else
  # if player didn't bust, must have stayed to get here
  prompt "You chose to stay!"

  loop do
    break if busted?(dealer_cards)

    if total(dealer_cards) >= 17
      prompt "Dealer stay"
      break
    else
      dealer_cards, deck = hit_card(dealer_cards, deck)
    end
  end

  if busted?(dealer_cards) || total(player_cards) > total(dealer_cards)
    prompt "You won!"
  elsif total(player_cards) == total(dealer_cards)
    prompt "It's a tie"
  else
    prompt "Dealer won!"
  end

  prompt "#{total(player_cards)} total"
  prompt "#{total(dealer_cards)} total"
end
