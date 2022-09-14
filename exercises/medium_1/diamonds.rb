# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

# Solution 1:
def diamond(size)
  mid = (size / 2) + 1
  stars = 1

  1.upto(mid) do
    puts ('*' * stars).center(size)
    stars += 2
  end

  stars = size - 2
  (mid - 1).downto(1) do
    puts ('*' * stars).center(size)
    stars -= 2
  end
end

# Solution 2:
def print_row(size, distance)
  stars = size - (distance * 2)
  puts ('*' * stars).center(size)
end

def diamond(size)
  mid = (size - 1) / 2
  mid.downto(0) { |line| print_row(size, line) }
  1.upto(mid) { |line| print_row(size, line) }
end

# Examples:
diamond(1)
# *
puts

diamond(3)
#  *
# ***
#  *
puts

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
