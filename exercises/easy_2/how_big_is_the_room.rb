# Build a program that asks a user for the length and width
# of a room in meters and then displays the area of the room
# in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example:
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

SQMETERS_TO_SQFEET = 10.7639

puts "=> Enter the length of the room in meters:"
length_in_meters = gets.chomp.to_f

puts "=> Enter the width of the room in meters:"
width_in_meters = gets.chomp.to_f

square_meters = (length_in_meters * width_in_meters).round(2)
square_feet_from_square_meters = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} square meters " \
     "(#{square_feet_from_square_meters} square feet)."

puts "-----------------------------------------"

# Further Exploration

# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches, and square centimeters.

SQFEET_TO_SQINCHES = 144
SQINCHES_TO_SQCENTIMETERS = 6.4516

puts "=> Enter the length of the room in feet:"
length_in_feet = gets.chomp.to_f

puts "=> Enter the width of the room in feet:"
width_in_feet = gets.chomp.to_f

square_feet = (length_in_feet * width_in_feet).round(2)
square_inches = (square_feet * SQFEET_TO_SQINCHES).round(2)
square_centimeters = (square_inches * SQINCHES_TO_SQCENTIMETERS).round(2)

puts "The are of the room is #{square_feet} square feet, " \
     "#{square_inches} square inches, " \
     "and #{square_centimeters} square centimeters."
