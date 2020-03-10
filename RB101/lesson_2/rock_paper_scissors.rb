VALID_CHOICES = %w(rock paper scissors).freeze


def name
  "George"
end

name = "Lisa"
loop do
  puts name
  break
end


def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt("It's a tie!")
  else
    prompt('Computer won!')
  end
end

loop do
  player_choice = ''
  loop do
    prompt("Choose one option: #{VALID_CHOICES.join(', ')}")
    player_choice = Kernel.gets.chomp

    break unless !VALID_CHOICES.include?(player_choice)
    prompt('Not valid choice.')
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{player_choice}; Computer chose: #{computer_choice};")

  display_result(player_choice, computer_choice)

  prompt('Do you want to play again? (y for play again)')
  play_again = Kernel.gets.chomp

  break unless play_again.downcase.start_with?('y')
end

# loop do
#   prompt('Welcome to loan calculator')
#   prompt('-----------------------------')

#   prompt('How much do you want to loan?')

#   loan_amount = ''
#   loop do
#     loan_amount = Kernel.gets.chomp

#     if loan_amount.empty? || loan_amount.to_f <= 0
#       prompt('Must enter positive number')
#     else
#       break
#     end
#   end

#   prompt('What is your interest rate?')
#   prompt('(Example: 5 for 5% or 2.5 for 2.5%)')
#   interest_rate = ''

#   loop do
#     interest_rate = Kernel.gets.chomp

#     if interest_rate.empty? || interest_rate.to_f <= 0
#       prompt('Must enter positive number')
#     else
#       break
#     end
#   end

#   prompt('What is the loan duration (in years)?')
#   loan_duration = ''

#   loop do
#     loan_duration = Kernel.gets.chomp

#     if loan_duration.empty? || loan_duration.to_i <= 0
#       prompt('Must enter positive number')
#     else
#       break
#     end
#   end

#   annual_interest_rate = interest_rate.to_f / 100
#   monthly_interest_rate = annual_interest_rate / 12
#   months = loan_duration.to_i * 12

#   prompt("annual_interest_rate is #{annual_interest_rate}")
#   prompt("monthly_interest_rate is #{monthly_interest_rate}")
#   prompt("months is #{months}")

#   monthly_payment =
#     loan_amount.to_f *
#     (monthly_interest_rate /
#     (1 - (1 + monthly_interest_rate)**-months))

#   prompt("Monthly payment is #{monthly_payment}")
#   prompt("Monthly payment is $#{format('%02.2f', monthly_payment)}")
# end
