# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of
# all numbers between 1 and the entered integer.

# Examples:
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.

# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def number?(int)
  int > 0
end

def calcluate_sum(int)
  1.upto(int).sum
end

def calcluate_product(int)
  1.upto(int).reduce(&:*)
end

integer = 0
loop do
  puts "=> Please enter an integer greater than 0:"
  integer = gets.chomp.to_i
  break if number?(integer)
  puts "=> Invalid input."
end

calculation = ''
loop do
  puts "=> Enter 's' to compute the sum, 'p' to compute the product."
  calculation = gets.chomp
  break if calculation == 's' || calculation == 'p'
  puts "=> Invalid selection."
end

if calculation == 's'
  sum = calcluate_sum(integer)
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
elsif calculation == 'p'
  product = calcluate_product(integer)
  puts "The product of the integers between 1 and #{integer} is #{product}."
end
