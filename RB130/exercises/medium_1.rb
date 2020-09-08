# # class Device
# #   def initialize
# #     @recordings = []
# #   end

# #   def record(recording)
# #     @recordings << recording
# #   end

# #   def listen
# #     # record(yield) if block_given?
# #     return unless block_given?
# #     recording = yield
# #     record(recording)
# #   end

# #   def play
# #     @recordings.last
# #   end
# # end


# # listener = Device.new
# # listener.listen { "Hello World!" }
# # listener.listen
# # p listener.play # Outputs "Hello World!"



# class TextAnalyzer
#   def process
#     # # your implementation
#     # p yield

#     # file = File.open("some_text.txt")
#     # file_data = file.readlines.map(&:chomp)

#     # paragraphs = 1
#     # lines = file_data.size
#     # words = 0

#     # file_data.each do |line|
#     #   paragraphs += 1 if line.empty?
#     #   words += line.split(' ').size
#     # end

#     # puts "#{paragraphs} paragraphs"
#     # puts "#{lines} lines"
#     # puts "#{words} words"

#     file = File.open("some_text.txt")
#     yield(file.read)
#     file.close
#   end 
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# analyzer.process { |text| puts "#{text.split(' ').count} words" }



# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) { |produce| puts "#{produce.join('; ').upcase}" }


# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']

# birds = ['crow', 'finch', 'hawk', 'eagle']


# def types(birds)
#   yield(birds)
# end

# types(birds) do |_, _, *raptors|
#   puts "Raptors: #{raptors.join(', ')}."
# end




# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end


# gather(items) do | *bla, wheat |
#   puts "#{bla.join(', ')}"
#   puts "#{wheat}"
# end


# gather(items) do | apples, *bla, wheat|
#   puts "#{apples}"
#   puts "#{bla.join(', ')}"
#   puts "#{wheat}"
# end


# gather(items) do | apples, *bla |
#   puts "#{apples}"
#   puts "#{bla.join(', ')}"
# end

# gather(items) do | apples, corn, cabbage, wheat|
#   puts "#{apples}, #{corn}, #{cabbage} and #{wheat}"
# end



# def convert_to_base_8(n)
#   # 8.to_s(8) will return 10 - some calculation is behind

#   n.to_s(8).to_i # replace these two method calls
# end

# # The correct type of argument must be used below
# base8_proc = method(:convert_to_base_8).to_proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)



def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]
p array

array2 = [5, 3, 7]
bubble_sort!(array2) { |first, second| first >= second }
p array2 == [7, 5, 3]
p array2

array3 = [6, 2, 7, 1, 4]
bubble_sort!(array3)
p array3 == [1, 2, 4, 6, 7]
p array3

array4 = [6, 12, 27, 22, 14]
bubble_sort!(array4) { |first, second| (first % 7) <= (second % 7) }
p array4 == [14, 22, 12, 6, 27]
p array4

array5 = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array5)
p array5 == %w(Kim Pete Tyler alice bonnie rachel sue)
p array5

array6 = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array6) { |first, second| first.downcase <= second.downcase }
p array6 == %w(alice bonnie Kim Pete rachel sue Tyler)
p array6
