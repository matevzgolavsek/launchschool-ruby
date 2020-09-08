class Anagram
  def initialize(matcher)
    @matcher = matcher
    @matcher_object = {}

    @matcher.chars.each do |char|
      if (@matcher_object[char])
        @matcher_object[char] += 1
      else
        @matcher_object[char] = 1
      end
    end

    @matcher_object
  end

  # def match(array_of_strings)
  #   result_array = []

  #   array_of_strings.each do |item|
  #     word = {}

  #     item.chars.each do |char|
  #       if (word[char])
  #         word[char] += 1
  #       else
  #         word[char] = 1
  #       end
  #     end

  #     result_array << item if word == @matcher_object && item != @matcher
  #   end
  #   result_array
  #   # array_of_objects.select { |object| object == @matcher_object }
  # end

  def match(array_of_strings)
    array_of_strings.select { |word| anagram?(word, @matcher)}
  end

  def anagram?(word1, word2)
    return false if word1.downcase === word2.downcase
    word1.downcase.chars.sort == word2.downcase.chars.sort
  end
end

detector = Anagram.new('ant')
anagrams = detector.match(%w(ant tan staaanddd at))

p anagrams