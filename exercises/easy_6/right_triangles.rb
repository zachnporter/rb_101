# Write a method that takes a positive integer, n, as an argument,
# and displays a right triangle whose sides each have n stars.
# The hypotenuse of the triangle (the diagonal side in the images below)
# should have one end at the lower-left of the triangle, and the other
# end at the upper-right.

def left_triangle(lines)
  spaces = lines - 1
  stars = 1

  loop do
    break if stars > lines
    puts ' ' * spaces + '*' * stars
    spaces -= 1
    stars += 1
  end
end

# Alternate Solution
def left_triangle(lines)
  lines.times do |num|
    spaces = lines - (num + 1)
    stars = num + 1

    puts (' ' * spaces) + ('*' * stars)
  end
end

# Further Exploration:
# Try modifying your solution so it prints the triangle upside down
# from its current orientation. Try modifying your solution again so that
# you can display the triangle with the right angle at any corner of the grid.

def flipped_left_triangle(lines)
  lines.times do |num|
    stars = lines - num
    spaces = num

    puts (' ' * spaces) + ('*' * stars)
  end
end

def right_triangle(lines)
  lines.times do |num|
    spaces = lines - (num + 1)
    stars = num + 1

    puts ('*' * stars) + (' ' * spaces)
  end
end

def flipped_right_triangle(lines)
  lines.times do |num|
    stars = lines - num
    spaces = num

    puts ('*' * stars) + (' ' * spaces)
  end
end

# Examples:
left_triangle(5)
puts "----------"
flipped_left_triangle(5)
puts "----------"
right_triangle(5)
puts "----------"
flipped_right_triangle(5)
puts "----------"

left_triangle(9)
puts "----------"
flipped_left_triangle(9)
puts "----------"
right_triangle(9)
puts "----------"
flipped_right_triangle(9)
