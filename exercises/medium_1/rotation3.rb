# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining
# digits, you get 329175. Keep the first 2 digits fixed in place and rotate
# again to 321759. Keep the first 3 digits fixed in place and rotate again
# to get 321597. Finally, keep the first 4 digits fixed in place and rotate
# the final 2 digits to get 321579. The resulting number is called the maximum
# rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should)
# use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  num_arr = number.to_s.chars
  num_arr[-n..-1] = rotate_array(num_arr[-n..-1])
  num_arr.join.to_i
end

# Using rotate_array
def max_rotation(number)
  num_arr = number.to_s.chars

  num_arr.size.times do |num|
    num_arr[num..-1] = rotate_array(num_arr[num..-1])
  end

  num_arr.join.to_i
end

# Using rotate_rightmost_digits
def max_rotation(number)
  n = number.to_s.size

  (n - 1).times do |num|
    number = rotate_rightmost_digits(number, n - num)
  end

  number
end

# Without helper methods
def max_rotation(number)
  num_arr = number.to_s.chars

  num_arr.size.times do |num|
    num_arr[num..-1] = num_arr[num + 1..-1] + [num_arr[num]]
  end

  num_arr.join.to_i
end

# Example:
puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
