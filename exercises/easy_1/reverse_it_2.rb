# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with words that contain five or more characters reversed.
# Each string will consist of only letters and spaces.
# Spaces should be included only when more than one word is present.

# Method 1
def reverse_words_1(string)
  reversed = []

  string.split.each do |word|
    if word.size >= 5
      reversed << word.reverse
    else
      reversed << word
    end
  end

  reversed.join(' ')
end

# Method 2
def reverse_words_2(string)
  string.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end

puts reverse_words_1('Professional') == 'lanoisseforP'
puts reverse_words_1('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words_1('Launch School') == 'hcnuaL loohcS'

puts reverse_words_2('Professional') == 'lanoisseforP'
puts reverse_words_2('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words_2('Launch School') == 'hcnuaL loohcS'
