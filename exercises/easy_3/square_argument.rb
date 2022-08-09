# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument
# (the square is the result of multiplying a number by itself).

# Example:
# square(5) == 25
# square(-8) == 64

def multiply(num1, num2)
  num1 * num2
end

def square(num, exp)
  return 1 if exp == 0
  start_number = num

  (exp - 1).times do |_|
    num = multiply(num, start_number)
  end

  num
end

p square(5, 4) == 625
p square(-8, 3) == -512
p square(6, 2) == 36
p square(3, 5) == 243
p square(5, 0) == 1
p square(10, 1) == 10
