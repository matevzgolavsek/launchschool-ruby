# # # # # class Machine

# # # # #   def start
# # # # #     flip_switch(:on)
# # # # #   end

# # # # #   def stop
# # # # #     flip_switch(:off)
# # # # #   end

# # # # #   private

# # # # #   attr_writer :switch

# # # # #   def flip_switch(desired_state)
# # # # #     self.switch = desired_state
# # # # #   end
# # # # # end

# # # # class FixedArray
# # # #   include Comparable
  

# # # #   attr_accessor :arr

# # # #   def initialize(num)
# # # #     @arr = Array.new(num) { |i| nil }
# # # #   end

# # # #   def to_a
# # # #     @arr.clone
# # # #   end

# # # #   def [](index)
# # # #     @arr.fetch(index)
# # # #   end

# # # #   def []=(index, value)
# # # #     self[index]             # raise error if index is invalid!
# # # #     @arr[index] = value
# # # #   end

# # # #   def to_s
# # # #     "#{@arr}"
# # # #   end
# # # # end

# # # # fixed_array = FixedArray.new(5)
# # # # puts fixed_array[3] == nil
# # # # puts fixed_array.to_a == [nil] * 5

# # # # fixed_array[3] = 'a'
# # # # puts fixed_array[3] == 'a'
# # # # puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# # # # fixed_array[1] = 'b'
# # # # puts fixed_array[1] == 'b'
# # # # puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# # # # fixed_array[1] = 'c'
# # # # puts fixed_array[1] == 'c'
# # # # puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# # # # fixed_array[4] = 'd'
# # # # puts fixed_array[4] == 'd'
# # # # puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# # # # puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# # # # puts fixed_array[-1] == 'd'
# # # # puts fixed_array[-4] == 'c'

# # # # begin
# # # #   fixed_array[6]
# # # #   puts false
# # # # rescue IndexError
# # # #   puts true
# # # # end

# # # # begin
# # # #   fixed_array[-7] = 3
# # # #   puts false
# # # # rescue IndexError
# # # #   puts true
# # # # end

# # # # begin
# # # #   fixed_array[7] = 3
# # # #   puts false
# # # # rescue IndexError
# # # #   puts true
# # # # end




# # # # class Student
# # # #   def initialize(name, year)
# # # #     @name = name
# # # #     @year = year
# # # #   end
# # # # end

# # # # class Graduate < Student
# # # #   def initialize(name, year, parking)
# # # #     super(name, year)
# # # #     @parking = parking
# # # #   end
# # # # end

# # # # class Undergraduate < Student
# # # #   def initialize(name, year)
# # # #     super
# # # #   end
# # # # end


# # # class CircularQueue
# # #   def initialize(size)
# # #     @buffer = [nil] * size
# # #     @next_position = 0
# # #     @oldest_position = 0
# # #   end

# # #   def enqueue(object)
# # #     unless @buffer[@next_position].nil?
# # #       @oldest_position = increment(@next_position)
# # #     end

# # #     @buffer[@next_position] = object
# # #     @next_position = increment(@next_position)
# # #   end

# # #   def dequeue
# # #     value = @buffer[@oldest_position]
# # #     @buffer[@oldest_position] = nil
# # #     @oldest_position = increment(@oldest_position) unless value.nil?
# # #     value
# # #   end

# # #   private

# # #   def increment(position)
# # #     (position + 1) % @buffer.size
# # #   end
# # # end



# # # queue = CircularQueue.new(3)
# # # puts queue.dequeue == nil

# # # queue.enqueue(1)
# # # queue.enqueue(2)
# # # puts queue.dequeue == 1

# # # queue.enqueue(3)
# # # queue.enqueue(4)
# # # puts queue.dequeue == 2

# # # queue.enqueue(5)
# # # queue.enqueue(6)
# # # queue.enqueue(7)
# # # puts queue.dequeue == 5
# # # puts queue.dequeue == 6
# # # puts queue.dequeue == 7
# # # puts queue.dequeue == nil

# # # queue = CircularQueue.new(4)
# # # puts queue.dequeue == nil

# # # queue.enqueue(1)
# # # queue.enqueue(2)
# # # puts queue.dequeue == 1

# # # queue.enqueue(3)
# # # queue.enqueue(4)
# # # puts queue.dequeue == 2

# # # queue.enqueue(5)
# # # queue.enqueue(6)
# # # queue.enqueue(7)
# # # puts queue.dequeue == 4
# # # puts queue.dequeue == 5
# # # puts queue.dequeue == 6
# # # puts queue.dequeue == 7
# # # puts queue.dequeue == nil



# # require 'set'

# # class MinilangError < StandardError; end
# # class BadTokenError < MinilangError; end
# # class EmptyStackError < MinilangError; end

# # class Minilang
# #   ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

# #   def initialize(program)
# #     @program = program
# #   end

# #   def eval
# #     @stack = []
# #     @register = 0
# #     @program.split.each { |token| eval_token(token) }
# #   rescue MinilangError => error
# #     puts error.message
# #   end

# #   private

# #   def eval_token(token)
# #     if ACTIONS.include?(token)
# #       send(token.downcase)
# #     elsif token =~ /\A[-+]?\d+\z/
# #       @register = token.to_i
# #     else
# #       raise BadTokenError, "Invalid token: #{token}"
# #     end
# #   end

# #   def push
# #     @stack.push(@register)
# #   end

# #   def pop
# #     raise EmptyStackError, "Empty stack!" if @stack.empty?
# #     @register = @stack.pop
# #   end

# #   def add
# #     @register += pop
# #   end

# #   def div
# #     @register /= pop
# #   end

# #   def mod
# #     @register %= pop
# #   end

# #   def mult
# #     @register *= pop
# #   end

# #   def sub
# #     @register -= pop
# #   end

# #   def print
# #     puts @register
# #   end
# # end


# # Minilang.new('PRINT').eval




# # class GuessingGame
# #   FIRST_NUM = 1
# #   LAST_NUM = 100
# #   GUESS_NUM_INIT = 7

# #   def initialize
# #     @result = rand(FIRST_NUM..LAST_NUM)
# #     @guess_num = GUESS_NUM_INIT
# #     @user_answer = nil
# #   end

# #   def play
# #     reset_game

# #     loop do
# #       guess_remaining
# #       enter_num
# #       user_answer
# #       check_result

# #       if(@user_answer == @result)
# #         puts "That's the number!"

# #         puts "You won!"
# #         break
# #       elsif @guess_num == 0
# #         puts "You have no more guesses. You lost!"
# #         break
# #       end
# #     end
# #   end

# #   def guess_remaining
# #     puts "You have #{@guess_num} guesses remaining."

# #     @guess_num -= 1
# #   end

# #   def enter_num
# #     puts "Enter a number between #{FIRST_NUM} and #{LAST_NUM}:"
# #   end

# #   def user_answer
# #     answer = gets.chomp
# #     @user_answer = answer.to_i
# #   end

# #   def check_result
# #     if(@result > @user_answer)
# #       puts "Your guess is too low."
# #       puts ""
# #     elsif (@result < @user_answer)
# #       puts "Your guess is too high."
# #       puts ""
# #     end
# #   end

# #   def reset_game
# #     @result = rand(FIRST_NUM..LAST_NUM)
# #     @guess_num = GUESS_NUM_INIT
# #   end
# # end


# # game = GuessingGame.new
# # game.play

# # # You have 7 guesses remaining.
# # # Enter a number between 1 and 100: 104
# # # Invalid guess. Enter a number between 1 and 100: 50
# # # Your guess is too low.

# # # You have 6 guesses remaining.
# # # Enter a number between 1 and 100: 75
# # # Your guess is too low.

# # # You have 5 guesses remaining.
# # # Enter a number between 1 and 100: 85
# # # Your guess is too high.

# # # You have 4 guesses remaining.
# # # Enter a number between 1 and 100: 0
# # # Invalid guess. Enter a number between 1 and 100: 80

# # # You have 3 guesses remaining.
# # # Enter a number between 1 and 100: 81
# # # That's the number!

# # # You won!




# class GuessingGame
#   attr_accessor :start_val, :end_val

#   MAX_GUESSES = 7
#   RANGE = 0..100

#   RESULT_OF_GUESS_MESSAGE = {
#     high:  "Your number is too high.",
#     low:   "Your number is too low.",
#     match: "That's the number!"
#   }.freeze

#   WIN_OR_LOSE = {
#     high:  :lose,
#     low:   :lose,
#     match: :win
#   }.freeze

#   RESULT_OF_GAME_MESSAGE = {
#     win:  "You won!",
#     lose: "You have no more guesses. You lost!"
#   }.freeze

#   def initialize(start_val, end_val)
#     @secret_number = nil
#     @start_val = start_val
#     @end_val = end_val
#   end

#   def play
#     reset
#     game_result = play_game
#     display_game_end_message(game_result)
#   end

#   private

#   def reset
#     @secret_number = rand(RANGE)
#   end

#   def play_game
#     result = nil
#     MAX_GUESSES.downto(1) do |remaining_guesses|
#       display_guesses_remaining(remaining_guesses)
#       result = check_guess(obtain_one_guess)
#       puts RESULT_OF_GUESS_MESSAGE[result]
#       break if result == :match
#     end
#     WIN_OR_LOSE[result]
#   end

#   def display_guesses_remaining(remaining)
#     puts
#     if remaining == 1
#       puts 'You have 1 guess remaining.'
#     else
#       puts "You have #{remaining} guesses remaining."
#     end
#   end

#   def obtain_one_guess
#     loop do
#       print "Enter a number between #{RANGE.first} and #{RANGE.last}: "
#       guess = gets.chomp.to_i
#       return guess if RANGE.cover?(guess)
#       print "Invalid guess. "
#     end
#   end

#   def check_guess(guess_value)
#     return :match if guess_value == @secret_number
#     return :low if guess_value < @secret_number
#     :high
#   end

#   def display_game_end_message(result)
#     puts "", RESULT_OF_GAME_MESSAGE[result]
#   end
# end


# game = GuessingGame.new(100, 200)
# game.play


class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end



# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]

# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8



# class Deck
#   include Enumerable 
#   RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze

#   def initialize
#     @deck = init_deck
#   end

#   def init_deck
#     deck = []

#     RANKS.each do |rank|
#       SUITS.each do |suit|
#         deck << Card.new(rank, suit)
#       end
#     end

#     deck.shuffle
#   end

#   def draw
#     if (@deck.size === 0)
#       @deck = init_deck
#     end

#     @deck.shift
#   end

#   def to_s
#     @deck
#   end
# end


class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }

# drawn.count { |card| card.rank == 5 } == 4
# drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# p drawn != drawn2

# p drawn
# p drawn2

# p deck
# p drawn


class PokerHand
  def initialize(deck)
    @hand = []
    @rank_count = Hash.new(0)

    5.times do 
      card = deck.draw

      @hand << card
      @rank_count[card.rank] += 1
    end
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def flush?
    suit = @hand.first.suit
    @hand.all? { |card| card.suit == suit }
  end

  def straight?
    return false if @rank_count.any? { |_, count| count > 1 }

    @hand.min.value == @hand.max.value - 4
  end

  def n_of_a_kind?(number)
    @rank_count.one? { |_, count| count == number }
  end

  def straight_flush?
    flush? && straight?
  end

  def royal_flush?
    straight_flush? && @hand.min.rank == 10
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    @rank_count.select { |_, count| count == 2 }.size == 2
  end

  def pair?
    n_of_a_kind?(2)
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'





