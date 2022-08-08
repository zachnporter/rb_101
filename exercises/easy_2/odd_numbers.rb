# Print all odd numbers from 1 to 99, inclusive,
# to the console, with each number on a separate line.

(1..99).each { |number| puts number if number.odd? }
