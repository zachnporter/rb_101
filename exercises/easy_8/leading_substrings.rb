# Write a method that returns a list of all substrings of a string
# that start at the beginning of the original string. The return value
# should be arranged in order from shortest to longest substring.

# First Solution:
def leading_substrings(string)
  result = []

  string.chars.each_with_index do |_, idx|
    result << string[0..idx]
  end

  result
end

# Second Solution:
def leading_substrings(string)
  result = []

  string.size.times do |num|
    result << string[0..num]
  end

  result
end

# Third Solution:
def leading_substrings(string)
  string.chars.map.with_index { |_, idx| string[0..idx] }
end

# Examples:
puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
