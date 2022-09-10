# Write a method that takes a first name, a space, and a last name
# passed as a single String argument, and returns a string that contains
# the last name, a comma, a space, and the first name.

def swap_name(name)
  "#{name.split[1]}, #{name.split[0]}"
end

# LS Solution:
def swap_name(name)
  name.split.reverse.join(', ')
end

# Examples:
puts swap_name('Joe Roberts') == 'Roberts, Joe'
