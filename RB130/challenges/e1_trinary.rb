class Trinary
  def initialize(number_string)
    @number_string = number_string
    @number_array = number_string.split('').reverse_each
    # Check if number is valid ... if array is only 8 or 9 or it contains any of alphabet
    # @is_invalid = @number.any? { |char| char =~ /\D|[^3-9]/ }
    # @is_valid = number.match(/[^0-2]/)
  end

  def to_decimal
    result = 0

    if @number_string.match(/[^0-2]/)
      result = 0
    else
      @number_array.each_with_index do |num, index|
        middle_result = num.to_i * (3 ** index)
        result += middle_result
      end
    end
    
    result
  end
end

bla = Trinary.new('10')

# p bla.to_decimal

# p 'b'.to_i


# 1*3^9 + 1*3^8 + 2*3^7 +2*3^6 + 0*3^5 + 0*3^4 + 0*3^3 + 1*3^2 + 2*3^1 + 0*3^0

# p (1*(3**9)) + (1*(3**8)) + (2*(3**7)) +(2*(3**6)) + (0*(3**5)) + (0*(3**4)) + (0*(3**3)) + (1*(3**2)) + (2*(3**1)) + (0*(3**0))

# 1122000120




class Hex
  A_TO_F = {
    'a': 10,
    'b': 11,
    'c': 12,
    'd': 13,
    'e': 14,
    'f': 15
  }

  def initialize(number_string)
    @number_string = number_string.downcase
    @number_array = @number_string.split('').reverse_each
    # Check if number is valid ... if array is only 8 or 9 or it contains any of alphabet
    # @is_invalid = @number.any? { |char| char =~ /\D|[^3-9]/ }
    # @is_valid = number.match(/[^0-2]/)
  end

  def to_decimal
    result = 0

    if @number_string.match(/[^0-9a-fA-F]/)
      # Also possible @number_string =~ /[^0-9a-fA-F]/
      result = 0
    else
      @number_array.each_with_index do |char, index|

        if (('a'..'f').include? char)
          middle_result = A_TO_F[char.to_sym] * (16 ** index)
        else 
          middle_result = char.to_i * (16 ** index)
        end

        result += middle_result
      end
    end
    
    result
  end
end

bla = Hex.new('1E240')

p bla.to_decimal



# p 'abc'.match(/[^0-9a-fA-F]/)


# 1*3^9 + 1*3^8 + 2*3^7 +2*3^6 + 0*3^5 + 0*3^4 + 0*3^3 + 1*3^2 + 2*3^1 + 0*3^0

# p (1*(3**9)) + (1*(3**8)) + (2*(3**7)) +(2*(3**6)) + (0*(3**5)) + (0*(3**4)) + (0*(3**3)) + (1*(3**2)) + (2*(3**1)) + (0*(3**0))

# 1122000120