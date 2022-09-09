# Write a method that returns a list of all substrings of a string.
# The returned list should be ordered by where in the string the
# substring begins. This means that all substrings that start at
# position 0 should come first, then all substrings that start at
# position 1, and so on. Since multiple substrings will occur at
# each position, the substrings at a given position should be returned
# in order from shortest to longest.

# You may (and should) use the leading_substrings method you
# wrote in the previous exercise:

def leading_substrings(string)
  result = []

  string.size.times do |num|
    result << string[0..num]
  end

  result
end

# First Solution:
def substrings(string)
  result = []

  string.size.times do |num|
    result << leading_substrings(string[num..-1])
  end

  result.flatten
end

# Second Solution:
def substrings(string)
  string.chars.map.with_index do |_, idx|
    leading_substrings(string[idx..-1])
  end.flatten
end

# Examples:
puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
