# Write a method that takes an Array as an argument, and
# reverses its elements in place; that is, mutate the Array
# passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(arr)
  arr.sort! do |a, b|
    arr.index(b) <=> arr.index(a)
  end
end

# Alternate Solution
def reverse!(arr)
  first_index = 0
  last_index = arr.size - 1

  while first_index < last_index
    arr[first_index], arr[last_index] = arr[last_index], arr[first_index]
    first_index += 1
    last_index -= 1
  end

  arr
end

# Examples:
list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true

# Note: for the test case list = ['abc'], we want to reverse the elements in
# the array. The array only has one element, a String, but we're not reversing
# the String itself, so the reverse! method call should return ['abc'].
