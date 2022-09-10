# Write a method that takes an integer argument, and returns
# an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a
# valid integer that is greater than 0.

def sequence(num)
  (1..num).to_a
end

# Examples:
puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]

# Further Exploration:
# Food for thought: what do you think sequence should return
# if the argument is not greater than 0. For instance,
# what should you do if the argument is -1?
# Can you alter your method to handle this case?

def further_sequence(num)
  num > 0 ? (1..num).to_a : (num..0).to_a
end

# # Examples:
puts further_sequence(-1) == [-1, 0]
puts further_sequence(-3) == [-3, -2, -1, 0]
