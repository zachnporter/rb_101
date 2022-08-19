# Write a method that takes two strings as arguments,
# determines the longest of the two strings,
# and then returns the result of concatenating the shorter string,
# the longer string, and the shorter string once again.
# You may assume that the strings are of different lengths.

def short_long_short(str1, str2)
  case str1.length <=> str2.length
  when -1 then "#{str1}#{str2}#{str1}"
  when  1 then "#{str2}#{str1}#{str2}"
  end
end

def short_long_short2(str1, str2)
  if str1.length < str2.length
    str1 + str2 + str1
  else
    str2 + str1 + str2
  end
end

# Examples:
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

p short_long_short2('abc', 'defgh') == "abcdefghabc"
p short_long_short2('abcde', 'fgh') == "fghabcdefgh"
p short_long_short2('', 'xyz') == "xyz"
