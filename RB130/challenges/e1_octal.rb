class Octal
  def initialize(number)
    @number = number.split('').reverse_each
    # Check if number is valid ... if array is only 8 or 9 or it contains any of alphabet
    @is_invalid = @number.any? { |char| char =~ /\D|[8-9]/ }
  end

  def to_decimal
    result = 0

    if @is_invalid
      result = 0
    else
      @number.each_with_index do |num, index|
        middle_result = num.to_i * (8 ** index)
        result += middle_result
      end
    end
    
    result
  end
end

bla = Octal.new('9asd9')

p bla.to_decimal