require 'yaml'


MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGUE = 'sl'

def messages(messages, lang='en')
  MESSAGES[lang][messages]
end


def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def operation_to_msg(operator)

  word = case operator
          when '1'
            return 'Adding'
          when '2'
            return 'Substracting'
          when '3'
            return 'Multiplying'
          when '4'
            return 'Dividing'
          end

  x = "a random line of code"
  word
end

prompt(messages('welcome', LANGUAGUE))

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('valid_name', LANGUAGUE))
  else
    break
  end
end

prompt("Hello my friend #{name}!")

loop do # MAIN LOOP
  num1 = ''
  loop do 
    prompt("What's the first number?")
    num1 = Kernel.gets().chomp()

    if valid_number?(num1)
      break
    else
      prompt("Number is not valid!")
    end
  end

  num2 = ''
  loop do
    prompt("What's the second number?")
    num2 = Kernel.gets().chomp()

    if valid_number?(num2)
      break
    else
      prompt("Number is not valid!")
    end
  end

  # <<-MSG is actually multiline string syntax (MSG could also be renamed to anything)
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add 
    2) substract 
    3) multiplay 
    4) divide
  MSG

  prompt(operator_prompt)
  
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_msg(operator)} the two numbers...")

  result = case operator
            when '1'
              result = num1.to_f() + num2.to_f()
            when '2'
              result = num1.to_f() - num2.to_f()
            when '3'
              result = num1.to_f() * num2.to_f()
            when '4'
              result = num1.to_f() / num2.to_f()
  end

  prompt("The result is: #{result}!")

  prompt("Do you want to perfom another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you, come again!")