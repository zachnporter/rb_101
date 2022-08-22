# Write a method that determines and returns the ASCII
# string value of a string that is passed in as an argument.
# The ASCII string value is the sum of the ASCII values of
# every character in the string.
# (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(string)
  string.chars.reduce(0) { |value, char| value + char.ord }
end

def ascii_value2(string)
  value = 0

  string.chars.each do |char|
    value += char.ord
  end

  value
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

p ascii_value2('Four score') == 984
p ascii_value2('Launch School') == 1251
p ascii_value2('a') == 97
p ascii_value2('') == 0
