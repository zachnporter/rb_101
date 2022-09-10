# Write a method that determines the mean (average) of the three scores
# passed to it, and returns the letter value associated with that grade.

# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'

# Tested values are all between 0 and 100.
# There is no need to check for negative values or values greater than 100.

# Further exploration:
# How would you handle this if there was a possibility of
# extra credit grades causing it to exceed 100 points?

def get_grade(score1, score2, score3)
  average_score = (score1 + score2 + score3) / 3

  case average_score
  when 0..59   then 'F'
  when 60..69  then 'D'
  when 70..79  then 'C'
  when 80..89  then 'B'
  when 90..100 then 'A'
  else              'A+'
  end
end

# Example:
puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
puts get_grade(99, 100, 105) == 'A+'
