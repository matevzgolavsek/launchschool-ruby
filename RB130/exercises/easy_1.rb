# class Tree
#   include Enumerable

#   def each
#     yield 1
#     yield 1, 2
#     yield
#   end

#   def compute
#     return 'Does not compute' unless block_given?
#     yield
#   end
# end

# # Tree.new.each_entry{ |item| p item }

# something = Tree.new
# p something.compute { 5 + 3 }

# something2 = Tree.new
# p something2.compute { 'a' + 'b' }

# something3 = Tree.new
# p something3.compute



# def missing(array)
#   # counter = 0

#   # first = array[0]
#   # last = array[array.size - 1]
#   # full_array = (first..last).to_a

#   # while counter < full_array.size
#   #   item = array[counter]

#   #   full_array.delete(item)

#   #   counter += 1
#   # end

#   # full_array


#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

# p missing([-3, -2, 1, 5])  # == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4])  # == []
# missing([1, 5])  # == [2, 3, 4]
# missing([6])  # == []

# def divisors(divisor)
#   # divisors_array = []

#   # (1..divisor).each do |num|
#   #   result = divisor % num
    
#   #   divisors_array << num if result === 0
#   # end

#   # divisors_array

#   1.upto(divisor).select do |candidate|
#     divisor % candidate == 0
#   end
# end

# p divisors(1) # == [1]
# p divisors(7) # == [1, 7]
# p divisors(12) # == [1, 2, 3, 4, 6, 12]
# p divisors(98) # == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) # == [1, 9967, 9973, 99400891]



# ENCRYPTED_PIONEERS = [
#   'Nqn Ybirynpr',
#   'Tenpr Ubccre',
#   'Nqryr Tbyqfgvar',
#   'Nyna Ghevat',
#   'Puneyrf Onoontr',
#   'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
#   'Wbua Ngnanfbss',
#   'Ybvf Unvog',
#   'Pynhqr Funaaba',
#   'Fgrir Wbof',
#   'Ovyy Tngrf',
#   'Gvz Orearef-Yrr',
#   'Fgrir Jbmavnx',
#   'Xbaenq Mhfr',
#   'Fve Nagbal Ubner',
#   'Zneiva Zvafxl',
#   'Lhxvuveb Zngfhzbgb',
#   'Unllvz Fybavzfxv',
#   'Tregehqr Oynapu'
# ].freeze

# def decrypt(string)
#   new_string = ''

#   string.split('').each do |char|
#     new_string += get_real_char(char)
#   end

#   new_string
# end

# def get_real_char(char)
#   first_array = ('a'..'m').to_a + ('A'..'M').to_a
#   second_array = ('n'..'z').to_a + ('N'..'Z').to_a

#   if(first_array.include?(char))
#     (char.ord + 13).chr
#   elsif (second_array.include?(char))
#     (char.ord - 13).chr
#   else
#     char
#   end
# end

# ENCRYPTED_PIONEERS.each do |string|
#   puts decrypt(string)
# end


# def rot13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end

# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else                         encrypted_char
#   end
# end

# ENCRYPTED_PIONEERS.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end



# def any?(array)
#   # counter = 0
#   # result = false

#   # while counter < array.size
#   #   result = true if yield(array[counter]) == true
#   #   counter += 1
#   # end

#   # result

#   array.each { |item| return true if yield(item) }
#   false
# end


# p any?([1, 3, 5, 6]) { |value| value.even? } # == true
# p any?([1, 3, 5, 7]) { |value| value.even? } # == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } # == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } # == true
# p any?([1, 3, 5, 7]) { |value| true } # == true
# p any?([1, 3, 5, 7]) { |value| false } # == false
# p any?([]) { |value| true } # == false


# def all?(array)
#   # array.each do |item| 
#   #   return false if !yield(item) 
#   # end
#   # true

#   collection.each { |item| return false unless yield(item) }
#   true
# end


# p all?([1, 3, 5, 6]) { |value| value.odd? } # == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } # == true
# p all?([2, 4, 6, 8]) { |value| value.even? } # == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } # == false
# p all?([1, 3, 5, 7]) { |value| true } # == true
# p all?([1, 3, 5, 7]) { |value| false } # == false
# p all?([]) { |value| false } # == true



# def none?(array)
#   array.each { |item| return false if yield(item) }
#   true
# end

# p none?([1, 3, 5, 6]) { |value| value.even? } #== false
# p none?([1, 3, 5, 7]) { |value| value.even? } #== true
# p none?([2, 4, 6, 8]) { |value| value.odd? } #== true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } #== false
# p none?([1, 3, 5, 7]) { |value| true } #== false
# p none?([1, 3, 5, 7]) { |value| false } #== true
# p none?([]) { |value| true } #== true


# def one?(array)
#   # result = false
#   # array.each do |item| 
#   #   if !yield(item)
#   #     result = true
#   #   elsif !yield(item) && result == true
#   #     return false
#   #   end
#   # end
#   # result

#   seen_one = false
#   array.each do |element|
#     next unless yield(element)
#     return false if seen_one
#     seen_one = true
#   end
#   seen_one
# end

# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false


def count(array)
  counter = 0
  array.each do |item|
    counter += 1 if yield(item)
  end
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } # == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } # == 2
p count([1,2,3,4,5]) { |value| true } # == 5
p count([1,2,3,4,5]) { |value| false } # == 0
p count([]) { |value| value.even? } # == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } # == 2

