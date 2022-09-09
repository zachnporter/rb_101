# Write a method that takes a string, and returns a new
# string in which every consonant character is doubled.
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace
# should not be doubled.

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if char.downcase =~ /[[a-zA-z]&&[^aeiou]]/
  end

  result
end

# Examples:
puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
