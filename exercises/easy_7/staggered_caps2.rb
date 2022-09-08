# Modify the method from the previous exercise so it ignores
# non-alphabetic characters when determining whether it should
# uppercase or lowercase each letter. The non-alphabetic characters
# should still be included in the return value; they just don't
# count when toggling the desired case.

# First Solution:
def staggered_case(string, ignore=true)
  result = ''
  upcase = true

  string.each_char do |char|
    upcase ? result << char.upcase : result << char.downcase

    if ignore
      upcase = !upcase if char =~ /[a-z]/i
    else
      upcase = !upcase
    end
  end

  result
end

# Second Solution:
def staggered_case(string, ignore=true)
  counter = 0

  string.chars.each_with_object('') do |char, result|
    counter.even? ? result << char.upcase : result << char.downcase

    if ignore
      counter += 1 if char =~ /[a-z]/i
    else
      counter += 1
    end
  end
end

# Further Exploration:
# Modify this method so the caller can determine whether non-alphabetic
# characters should be counted when determining the upper/lowercase state.
# That is, you want a method that can perform the same actions that this
# method does, or operates like the previous version.

# Examples:
puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts staggered_case('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS', false) == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'
