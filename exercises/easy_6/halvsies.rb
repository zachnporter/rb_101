# Write a method that takes an Array as an argument, and returns two
# Arrays (as a pair of nested Arrays) that contain the first half and
# second half of the original Array, respectively. If the original array
# contains an odd number of elements, the middle element should be placed
# in the first half Array.

def halvsies(array)
  middle = (array.size / 2.0).round

  arr1 = array[0, middle]
  arr2 = array[middle, array.size - middle]

  [arr1, arr2]
end

# Examples:
puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
