# Write a method named include? that takes an Array and a
# search value as arguments. This method should return true if
# the search value is in the array, false if it is not.
# You may not use the Array#include? method in your solution.

def include?(array, value)
  index = 0
  while index < array.size
    return true if array[index] == value
    index += 1
  end

  false
end

# Alternate Solution 1:
def include?(array, value)
  array.each { |num| return true if num == value }
  false
end

# Alternate Solution 2:
def include?(array, value)
  result = array.select { |num| num == value }
  result.empty? ? false : true
end

# LS Solution:
def include?(array, value)
  !!array.find_index { |num| num == value }
end

puts include?([1, 2, 3, 4, 5], 3) == true
puts include?([1, 2, 3, 4, 5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
