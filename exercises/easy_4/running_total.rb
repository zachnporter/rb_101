# Write a method that takes an Array of numbers, and returns an Array
# with the same number of elements, and each element has the
# running total from the original Array.

def running_total(numbers)
  sum = 0
  numbers.map { |number| sum += number }
end

def running_total2(numbers)
  total = []

  numbers.reduce(0) do |sum, num|
    total << sum += num
    sum
  end

  total
end

def running_total3(numbers)
  sum = 0
  numbers.each_with_object([]) { |num, arr| arr << sum += num }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

p running_total2([2, 5, 13]) == [2, 7, 20]
p running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total2([3]) == [3]
p running_total2([]) == []

p running_total3([2, 5, 13]) == [2, 7, 20]
p running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total3([3]) == [3]
p running_total3([]) == []
