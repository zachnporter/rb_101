# Print all even numbers from 1 to 99, inclusive,
# to the console, with each number on a separate line.

1.upto(99).each { |number| puts number if number.even? }
