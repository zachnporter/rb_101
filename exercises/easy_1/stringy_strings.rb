# Write a method that takes one argument, a positive integer,
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

def stringy(size, start = 1)
  binary_string = ''

  size.times do |num|
    if start == 1
      number = num.even? ? '1' : '0'
    else
      number = num.odd? ? '1' : '0'
    end

    binary_string << number
  end

  binary_string
end

puts stringy(6, 0) == '010101'
puts stringy(9) == '101010101'
puts stringy(4, 0) == '0101'
puts stringy(7) == '1010101'

# The tests above should print true.
