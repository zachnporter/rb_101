# Write a method that returns the next to last word
# in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(string)
  string.split[-2]
end

# Examples:
puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

# Further Exploration:

# Suppose we need a method that retrieves the middle word of a phrase/sentence.
# What edge cases need to be considered? How would you handle those edge cases
# without ignoring them? Write a method that returns the middle word of a
# phrase or sentence. It should handle all of the edge cases you thought of.

def middle_word(string)
  word_array = string.split
  middle = word_array.size / 2

  if word_array.empty?
    ''
  elsif word_array.size.odd?
    word_array[middle]
  else
    word_array[middle - 1, 2].join(' ')
  end
end

puts middle_word('Odd length sentence') == 'length'
puts middle_word('Launch School is great!') == 'School is'
puts middle_word('Hello there') == 'Hello there'
puts middle_word("Hello") == 'Hello'
puts middle_word('Lord of the Rings is a classic') == 'Rings'
puts middle_word('') == ''
