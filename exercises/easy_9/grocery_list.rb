# Write a method which takes a grocery list (array) of fruits with
# quantities and converts it into an array of the correct number of each fruit.

# Solution 1:
def buy_fruit(list)
  result = []

  list.each do |fruit, qty|
    qty.times { result << fruit }
  end

  result
end

# Solution 2:
def buy_fruit(list)
  list.each_with_object([]) do |(fruit, qty), arr|
    qty.times { arr << fruit }
  end
end

# LS Solution:
def buy_fruit(list)
  list.map { |fruit, qty| [fruit] * qty }.flatten
end

# Example:
puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == [
  "apples", "apples", "apples", "orange", "bananas", "bananas"
]
