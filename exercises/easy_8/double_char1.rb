# Write a method that takes a string, and returns
# a new string in which every character is doubled.

# Solution 1:
def repeater(string)
  string.chars.each_with_object('') do |char, str|
    str << char * 2
  end
end

# Solution 2:
def repeater(string)
  result = ''
  string.each_char { |char| result << char * 2 }
  result
end

# Solution 3:
def repeater(string)
  result = ''
  counter = 0

  loop do
    break if counter >= string.size
    result << string[counter] * 2
    counter += 1
  end

  result
end

# Examples:
puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
