# Write a program that will ask a user for an input of a word or
# multiple words and give back the number of characters.
# Spaces should not be counted as a character.

# Input:
# Please write word or multiple words: walk

# Output:
# There are 4 characters in "walk".

puts "=> Please write a word or multiple words:"
input = gets.chomp
count = input.delete(' ').size
puts "=> There are #{count} characters in #{input}"
