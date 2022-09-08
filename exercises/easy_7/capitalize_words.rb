# Write a method that takes a single String argument and returns
# a new string that contains the original value of the argument with
# the first character of every word capitalizedand all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

# Further Exploration:

# Ruby conveniently provides the String#capitalize method to capitalize strings.
# Without that method, how would you solve this problem?
# Try to come up with at least two solutions.

def word_cap(string)
  capitalized_words = string.split.map do |word|
    word[0].upcase + word[1..-1].downcase
  end

  capitalized_words.join(' ')
end

def word_cap(string)
  index = 0
  result = ''

  while index < string.size
    if index == 0 || string[index - 1] == ' '
      result << string[index].upcase
    else
      result << string[index].downcase
    end

    index += 1
  end

  result
end

# Examples:
puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
