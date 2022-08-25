# Write a method that takes an Array, and returns a new Array
# with the elements of the original list in reverse order.
# Do not modify the original list.

# You may not use Array#reverse or Array#reverse!,
# nor may you use the method you wrote in the previous exercise.

def reverse(array)
  reversed_arr = []
  array.each { |element| reversed_arr.prepend(element) }
  reversed_arr
end

# Alternate Solution 1:
def reverse(array)
  array.each_with_object([]) { |item, arr| arr.prepend(item) }
end

# Alternate Solution 2:
def reverse(array)
  reversed_arr = []
  index = 0

  while index <= array.size - 1
    reversed_arr.prepend(array[index])
    index += 1
  end

  reversed_arr
end

# LS Alternate Solution:
def reverse(array)
  array.inject([], :unshift)
end

# Examples:
puts reverse([1, 2, 3, 4]) == [4, 3, 2, 1]    # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
