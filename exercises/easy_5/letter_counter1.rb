# Write a method that takes a string with one or more
# space separated words and returns a hash that shows the
# number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(string)
  string.split.each_with_object({}) do |word, size_count|
    if size_count[word.size]
      size_count[word.size] += 1
    else
      size_count[word.size] = 1
    end
  end
end

def word_sizes2(string)
  size_count = Hash.new(0)
  string.split.each { |word| size_count[word.size] += 1 }
  size_count
end

# Examples:
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes2("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes2('') == {}
