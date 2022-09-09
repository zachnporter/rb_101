# Write a method that returns a list of all substrings of a string
# that are palindromic. That is, each substring must consist of the
# same sequence of characters forwards as it does backwards. The return
# value should be arranged in the same sequence as the substrings
# appear in the string. Duplicate palindromes should be included
# multiple times.

# You may (and should) use the substrings method you
# wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters
# and pay attention to case; that is, "AbcbA" is a palindrome,
# but neither "Abcba" nor "Abc-bA" are. In addition,
# assume that single characters are not palindromes.

def leading_substrings(string)
  result = []

  string.size.times do |num|
    result << string[0..num]
  end

  result
end

def substrings(string)
  result = []

  string.size.times do |num|
    result << leading_substrings(string[num..-1])
  end

  result.flatten
end

def palindrome?(string)
  string.size > 1 && string == string.reverse
end

def palindromes(string)
  substring_array = substrings(string)

  substring_array.select do |str|
    palindrome?(str)
  end
end

# Examples:
puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration:

# Can you modify this method (and/or its predecessors)
# to ignore non-alphanumeric characters and case?
# Alphanumeric characters are alphabetic characters
# (upper and lowercase) and digits.

def palindromes(string)
  substring_array = substrings(string)

  substring_array.select do |str|
    str = str.downcase.delete("^a-z")
    palindrome?(str)
  end
end
