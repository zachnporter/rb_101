# Given the array...
words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

# Write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same exact letters in them but in
# a different order. Your output should look something like this:
# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)

# Solution 1:
def find_anagrams(start_word, words_list)
  result = []

  words_list.each do |word|
    result << word if start_word.chars.sort == word.chars.sort
  end

  result
end

def print_anagrams(words_list)
  result = []

  words_list.each do |word|
    anagrams = find_anagrams(word, words_list)
    result << anagrams
  end

  result.uniq.each { |list| p list }
end

# Refactored Solution:
def find_anagrams(start_word, words)
  words.select do |word|
    word if start_word.chars.sort == word.chars.sort
  end
end

def print_anagrams(words)
  words.map { |word| find_anagrams(word, words) }.uniq.each { |list| p list }
end

print_anagrams(words)

# LS Solution:
result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end
