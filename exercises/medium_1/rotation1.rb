# Write a method that rotates an array by moving the
# first element to the end of the array.
# The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# Example:
puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true

# Further Exploration:
# Write a method that rotates a string instead of an array.
# Do the same thing for integers.
# You may use rotate_array from inside your new method.

def rotate_string(string)
  rotate_array(string.chars).join
end

puts rotate_string("Hello") == "elloH"

def rotate_integer(number)
  rotate_array(number.to_s.chars).join.to_i
end

puts rotate_integer(735291) == 352917
