# Write a method that can rotate the last n digits of a number.

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from
# the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# My Solution:
def rotate_rightmost_digits(number, n)
  num_arr = number.to_s.chars
  front = num_arr[0..-n - 1]
  back = rotate_array(num_arr[-n..-1])

  if back.size < 6
    (front + back).join.to_i
  else
    back.join.to_i
  end
end

# LS Solution:
def rotate_rightmost_digits(number, n)
  num_arr = number.to_s.chars
  num_arr[-n..-1] = rotate_array(num_arr[-n..-1])
  num_arr.join.to_i
end

# For example:
puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
