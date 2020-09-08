class Series
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def slices(slice_number)
    final_array = []
    split_array = self.number.split('')
    split_array.map!(&:to_i)

    raise ArgumentError, 'Argument larger then digits' unless slice_number <= split_array.size 

    # SOLUTION 1
    # split_array.each_with_index do |num, index|
    #   current_array = slice_number == 1 ? [num] : split_array[(index..(index + slice_number - 1))]

    #   final_array << current_array if current_array.size >= slice_number
    # end

    # final_array

    # SOLUTION 2
    split_array.each_cons(slice_number).to_a
  end
end

series = Series.new('01234')

p series.slices(2)