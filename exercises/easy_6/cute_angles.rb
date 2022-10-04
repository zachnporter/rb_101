=begin
Write a method that takes a floating point number that represents
an angle between 0 and 360 degrees and returns a String that represents
that angle in degrees, minutes and seconds. You should use a
degree symbol to represent degrees, a single quote (') to represent minutes,
and a double quote (") to represent seconds. A degree has 60 minutes,
while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round values,
but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when
formatting the minutes and seconds, e.g., 321°03'07".
=end

# You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"

# Original solution
def dms(number)
  degrees = number.to_i
  minutes = (number % 1) * 60.0
  seconds = (minutes % 1) * 60.0

  format("#{degrees}#{DEGREE}%02d'%02d\"", minutes, seconds)
end

# LS Solution:
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms_ls(float)
  seconds = float * SECONDS_PER_DEGREE
  degrees, seconds_remaining = seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = seconds_remaining.divmod(SECONDS_PER_MINUTE)

  format("#{degrees}#{DEGREE}%02d'%02d\"", minutes, seconds)
end

# New solution on 10/4 including further exploration:
def dms(num)
  loop do
    num -= 360 if num > 360
    num += 360 if num < 0
    break if num >= 0 && num <= 360
  end

  degrees = num.floor
  minutes = (num % 1) * 60
  seconds = (minutes % 1) * 60

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# Examples:
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
