# Write a method that will take a short line of text, and print it within a box.

def print_in_box(string)
  length = string.length + 2
  top_bottom = '+' + '-' * length + '+'
  middle = '|' + ' ' * length + '|'
  center = "| #{string} |"

  puts top_bottom
  puts middle
  puts center
  puts middle
  puts top_bottom
end

# Example:
print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# Modify this method so it will truncate the message if it will be
# too wide to fit inside a standard terminal window
# (80 columns, including the sides of the box).

def print_in_box2(string)
  length = string.length
  length = 76 if string.length + 4 > 80

  top_bottom = "+#{'-' * (length + 2)}+"
  middle = "|#{' ' * (length + 2)}|"
  center = "| #{string[0, length]} |"

  puts top_bottom
  puts middle
  puts center
  puts middle
  puts top_bottom
end

long_string = "this is an extra long string in order to test a method \
that will truncate a string exceeding an 80 char limit."

print_in_box2(long_string)
