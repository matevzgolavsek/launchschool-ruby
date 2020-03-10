
def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  prompt('Welcome to loan calculator')
  prompt('-----------------------------')

  prompt('How much do you want to loan?')

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets.chomp

    if loan_amount.empty? || loan_amount.to_f <= 0
      prompt('Must enter positive number')
    else
      break
    end
  end

  prompt('What is your interest rate?')
  prompt('(Example: 5 for 5% or 2.5 for 2.5%)')
  interest_rate = ''

  loop do
    interest_rate = Kernel.gets.chomp

    if interest_rate.empty? || interest_rate.to_f <= 0
      prompt('Must enter positive number')
    else
      break
    end
  end

  prompt('What is the loan duration (in years)?')
  loan_duration = ''

  loop do
    loan_duration = Kernel.gets.chomp

    if loan_duration.empty? || loan_duration.to_i <= 0
      prompt('Must enter positive number')
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = loan_duration.to_i * 12

  prompt("annual_interest_rate is #{annual_interest_rate}")
  prompt("monthly_interest_rate is #{monthly_interest_rate}")
  prompt("months is #{months}")

  monthly_payment =
    loan_amount.to_f *
    (monthly_interest_rate /
    (1 - (1 + monthly_interest_rate)**-months))

  prompt("Monthly payment is #{monthly_payment}")
  prompt("Monthly payment is $#{format('%02.2f', monthly_payment)}")
end
