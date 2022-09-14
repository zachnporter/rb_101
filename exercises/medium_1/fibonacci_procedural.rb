# In the previous exercise, we developed a recursive solution to calculating
# the nth Fibonacci number. In a language that is not optimized for recursion,
# some (not all) recursive methods can be extremely slow and require massive
# quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion,
# but it isn't designed for heavy recursion; as a result, the Fibonacci solution
# is only useful up to about fibonacci(40). With higher values of nth,
# the recursive solution is impractical. (Our tail recursive solution did much
# better, but even that failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a
# non-recursive (procedural) method.

# Rewrite your recursive fibonacci method so that it computes
# its results without recursion.

# PEDAC
# input: positive number

# output: positive number

# rules:
#   explicit:
#     must be non-recursive
#     return the nth fiboncacci number
#     sequence: F(n) = F(n - 1) + F(n - 2) if n > 2
#   implicit:
#     n > 0

# data structure/algorithm:
#  -return 1 if n <= 2
#  -initialize array to [1, 1]
#  -n-2 times do
#  -array << array[current_idx] + array[current_idx + 1]
#  -return array.last

# Solution 1A:
def fibonacci(n)
  fib_sequence = [1, 1]

  (n - 2).times do |num|
    fib_sequence << fib_sequence[num] + fib_sequence[num + 1]
  end

  fib_sequence.last
end

# Solution 1B:
def fibonacci(n)
  fib_sequence = [1, 1]

  3.upto(n) do
    fib_sequence = [fib_sequence.last, (fib_sequence.last + fib_sequence.first)]
  end

  p fib_sequence.last
end

# Solution 2:
def fibonacci(n)
  return 1 if n <= 2
  num1, num2 = [1, 1]

  (n - 2).times do
    num1, num2 = [num2, num1 + num2]
  end

  num2
end

# Examples:
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(10) == 55
# [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501
