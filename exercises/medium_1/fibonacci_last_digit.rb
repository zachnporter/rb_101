# In the previous exercise, we developed a procedural method for computing the
# value of the nth Fibonacci numbers. This method was really fast, computing
# the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns
# the last digit of the nth Fibonacci number.

# Solution 1: (Too slow)
# def fibonacci_last(n)
#   last = fibonacci(n) % 100
#   last.to_s[-1].to_i
# end

# Solution 2 (LS Solution):
def fibonacci_last(n)
  fib_sequence = [1, 1]

  3.upto(n) do
    fib_sequence = [fib_sequence.last, (fib_sequence.last + fib_sequence.first) % 10]
  end

  fib_sequence.last.to_s[-1].to_i
end

# Examples:
p fibonacci_last(15)
# -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)
# -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)
# -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)
# -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007)
# -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789)
# -> 4
