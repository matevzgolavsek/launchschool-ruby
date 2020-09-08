class Sieve
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def is_prime?(number)
    return false if number == 1 # Guard for number 1 as it is true and it is not a prime

    (2..(number - 1)).each do |item|
      return false if number % item == 0
    end

    true
  end

  def primes
    (2..@number).select do |num|
      # is_prime?(num)
      (2..(num - 1)).each do |item|
        break if num % item == 0
      end
    end
  end
end

sieve = Sieve.new(10)

p sieve.primes