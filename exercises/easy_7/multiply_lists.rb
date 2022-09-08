# Write a method that takes two Array arguments in which each Array
# contains a list of numbers, and returns a new Array that contains
# the product of each pair of numbers from the arguments that have
# the same index. You may assume that the arguments contain the same
# number of elements.

# First Solution:
def multiply_list(arr1, arr2)
  result = []
  arr1.each_with_index { |num, idx| result << num * arr2[idx] }
  result
end

# Second Solution:
def multiply_list(arr1, arr2)
  arr1.each_with_object([]).with_index do |(num, arr), idx|
    arr << num * arr2[idx]
  end
end

# Third Solution:
def multiply_list(arr1, arr2)
  result = []
  arr1.zip(arr2) { |a, b| result << a * b }
  result
end

# Fourth Solution:
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr.reduce(:*) }
end

# Examples:
puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
