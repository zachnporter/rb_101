# Write a method that combines two Arrays passed in as arguments,
# and returns a new Array that contains all elements from both
# Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty,
# and that they have the same number of elements.

def interleave(arr1, arr2)
  p arr1.zip(arr2).flatten
end

# Alternate Solution:
def interleave(arr1, arr2)
  result = []
  arr1.each_with_index do |_, index|
    result << arr1[index] << arr2[index]
  end

  result
end

# Example:
puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
