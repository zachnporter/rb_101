# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not
# the 6th number appears amongst the first 5 numbers.

# Example:
# ==> Enter the 1st number: 25
# ==> Enter the 2nd number: 15
# ==> Enter the 3rd number: 20
# ==> Enter the 4th number: 17
# ==> Enter the 5th number: 23
# ==> Enter the last number: 17
# The number 17 appears in [25, 15, 20, 17, 23].

order = %w(1st 2nd 3rd 4th 5th last)
numbers = []
last = nil

loop do
  puts "=> Enter the #{order.shift} number:"

  if order.empty?
    last = gets.chomp.to_i
    break
  end

  numbers << gets.chomp.to_i
end

if numbers.include?(last)
  puts "The number #{last} appears in #{numbers}."
else
  puts "The number #{last} does not appear in #{numbers}."
end
