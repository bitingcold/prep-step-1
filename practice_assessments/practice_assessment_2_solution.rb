# In Order

# Define a boolean method, #in_order?(array), that accepts an array of integers
# as an argument. This method should return true if elements in the array are
# in order from smallest to largest (left to right), and false otherwise.

def in_order?(array)
  array.each_with_index do |el, idx|
    next if idx == 0
    return false unless el >= array[idx - 1]
  end

  true
end

puts "-------In Order-------"
puts in_order?([1, 2, 3]) == true
puts in_order?([1, 2, 2, 10]) == true
puts in_order?([3, 6, 4, 7]) == false
puts in_order?([-10, -2, 0, 23, 101]) == true

# ------------------------------------------------------------------------------

# Boolean to Binary

# Define a method, #boolean_to_binary(array), that accepts an array of booleans as
# an argument. Your method should convert the array into a string made entirely
 # of 1s and 0s. A true should become a "1" and a false should become a "0".

def boolean_to_binary(array)
  binary = ""

  array.each do |boolean|
    if boolean
      binary << "1"
    else
      binary << "0"
    end
  end

  binary
end

puts "-------Boolean to Binary-------"
puts boolean_to_binary([true]) == "1"
puts boolean_to_binary([false]) == "0"
puts boolean_to_binary([true, false, true]) == "101"
puts boolean_to_binary([false, true, true, false, true, true]) == "011011"

# ------------------------------------------------------------------------------

# More Vowels

# Define a method, #more_vowels(string1, string2), that accepts two strings as
# arguments. Your method should return the string with more vowels. Return "tie"
# if the words have the same number of vowels.

def count_vowels(word)
  vowels = %w(a e i o u)
  idx = 0
  count = 0

  while idx < word.length
    count += 1 if vowels.include?(word[idx])
    idx += 1
  end

  count
end

def more_vowels(string1, string2)
  vowel_count_1 = count_vowels(string1)
  vowel_count_2 = count_vowels(string2)

  if vowel_count_1 > vowel_count_2
    string1
  elsif vowel_count_2 > vowel_count_1
    string2
  else
    "tie"
  end
end

puts "-------More Vowels-------"
puts more_vowels("aaa", "ee") == "aaa"
puts more_vowels("abcdefghi", "bcdfgh") == "abcdefghi"
puts more_vowels("woodchuck", "spaghetti") == "tie"
puts more_vowels("alphabetical", "serendipity") == "alphabetical"

# ------------------------------------------------------------------------------

# Fibonacci Sequence

# The Fibonacci Sequence follows a simple rule: the next number in the sequence is the sum
# of the previous two. The sequence starts with [0, 1]. We then compute the 3rd
# number by summing the first & the second: 0 + 1 == 1. This yields [0, 1, 1]. We compute
# the 4th number by summing the second and the third: 1 + 1 == 2... and the pattern
# continues

# Define a method, #fibs, that accepts an integer as an argument. The method should
# return an array of the first n Fibonacci numbers.
#
# fibs(6) => [0, 1, 1, 2, 3, 5]

def fibs(n)
  sequence = [0, 1]
  return sequence[0, n] if n <= 2

  until sequence.length == n
    sequence << sequence[-1] + sequence[-2]
  end

  sequence
end

puts "-------Fibonacci-------"
puts fibs(0) == []
puts fibs(1) == [0]
puts fibs(3) == [0, 1, 1]
puts fibs(10) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
