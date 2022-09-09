# Mad libs are a simple game where you create a story template with blanks
# for words. You, or another player, then construct a list of words and place
# them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb,
# an adverb, and an adjective and injects those into a story that you create.

system 'clear'

def prompt(str)
  puts "=> #{str}"
end

prompt "Enter a noun:"
noun = gets.chomp

prompt "Enter a verb:"
verb = gets.chomp

prompt "Enter an adjective:"
adjective = gets.chomp

prompt "Enter an adverb:"
adverb = gets.chomp

prompt "Building Madlib..."
puts '3'
sleep(1)
puts '2'
sleep(1)
puts '1'
sleep(1)

prompt "I like to #{adverb} #{verb} my #{adjective} #{noun} in the morning!"

# Example:
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!
