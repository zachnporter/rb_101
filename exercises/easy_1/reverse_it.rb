# Write a method that takes one argument, a string,
# and returns a new string with the words in reverse order.

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

# Alternate Method:
# def reverse_sentence(string)
#   reversed = []
#   words = string.split

#   loop do
#     break if words.empty?
#     reversed << words.pop
#   end

#   reversed.join(' ')
# end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
