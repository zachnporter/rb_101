# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
 
def msg(string)
  puts ">> #{string}"
end

msg("Welcome to Calculator!")

msg("What's the first number?")
number1 = gets.chomp

msg("What's the second number?")
number2 = gets.chomp

msg("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide?")
operator = gets.chomp

case operator
when '1'
  result = number1.to_i + number2.to_i
when '2'
  result = number1.to_i - number2.to_i
when '3'
  result = number1.to_i * number2.to_i
when '4'
  result = number1.to_f / number2.to_f
end

msg("The result is #{result}")