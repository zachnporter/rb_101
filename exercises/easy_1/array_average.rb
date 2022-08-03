# Write a method that takes one argument, an array containing integers,
# & returns the average of all numbers in the array.
# The array will never be empty & the numbers will always be positive integers.
# Your result should also be an integer.

def int_average(numbers)
  numbers.sum / numbers.size
end

puts int_average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts int_average([1, 5, 87, 45, 8, 8]) == 25
puts int_average([9, 47, 23, 95, 16, 52]) == 40

# The tests above should print true.

# Further Exploration:
# Currently, the return value of average is an Integer.
# When dividing numbers, sometimes the quotient isn't a whole number,
# therefore, it might make more sense to return a Float.
# Can you change the return value of average from an Integer to a Float?

def float_average(numbers)
  numbers.sum.to_f / numbers.size
end

puts float_average([1, 6]) == 3.5 # integer division: (1 + 6) / 2 -> 3
puts float_average([1, 5, 87, 45, 16]) == 30.8
puts float_average([10, 47, 23, 95, 16, 52]) == 40.5

# The tests above should print true.
