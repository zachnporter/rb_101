# Write a method that counts the number of occurrences
# of each element in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'.
# Once counted, print each element alongside the number of occurrences.

# Expected Output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

def count_occurrences(arr)
  unique_items = {}

  arr.uniq.each { |item| unique_items[item] = arr.count(item) }

  unique_items.each { |item, count| puts "#{item} => #{count}" }
end

# Alternate Method:

# def count_occurrences(arr)
#   arr.uniq.each { |item| puts "#{item} => #{arr.count(item)}" }
# end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
