def string_lengths1(sentence)
  strings = sentence.split

  strings.map { |chars| chars.length }
end


def string_lengths2(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
end

def string_lengths3(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size do
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end

def string_lengths4(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

print string_lengths1('To be or not to be');
print string_lengths2('To be or not to be');
print string_lengths3('To be or not to be');
print string_lengths4('To be or not to be');
