# PEDAC
| Objective | Step | Description|
| :---      | :--- | :---       |
| Process the Problem | Understand the Problem | <ul><li>Identify expected input and output</li><li>Make the requirements explicit</li><li>Identify rules</li><li>Mental model of the problem (optional)</li></ul> |
| | Examples/Test Case | Validate understanding of the problem |
| | Data Structure | How we represent data that we will work with when converting the input to output. |
| | Algorithm | Steps for converting input to output |
| Code with Intent | Code | Implementation of Algorithm |
<br>

# Example 1

#### **PROBLEM:**

> Given a string, write a method change_me which returns the same
string but with all the words in it that are palindromes uppercased.

#### **EXAMPLES/TEST CASES:**

```ruby
change_me("We will meet at noon") == "We will meet at NOON"
change_me("No palindromes here") == "No palindromes here"
change_me("") == ""
change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"
```
<br>

**input**: string

**output**: string (not the same object)

**rules**:  
- **Explicit requirements:**
  - every palindrome in the string must be converted to
    uppercase. (Reminder: a palindrome is a word that reads
    the same forwards and backward).
  - Palindromes are case sensitive ("Dad" is not a palindrome, but "dad" is.)

- **Implicit requirements:**
  - the returned string shouldn't be the same string object.
  - if the string is an empty string, the result should be an empty
    string
<br><br>

# Example 2

#### **PROBLEM:**

> Given a string, write a method `palindrome_substrings` which returns all the substrings from a given string which are palindromes.  
Consider palindrome words case sensitive.

#### **EXAMPLES/TEST CASES:**

```ruby
palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []
```

**input:** string

**output:** array

**rules:**
- **Explicit requirements:**
  - return substrings that are palindromes
  - Palindromes are case sensitive

- **Implicit requirements:**
  - if the string is an empty string, return an empty array
  - if there are no palidromes, return an empty array

#### **ALGORITHM:**
*substrings method*
- create an empty array called `result` that will contain all required substrings
- create a `starting_index` variable (value `0`) for the starting index of a substring
- start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
  - create a `num_chars` variable (value `2`) for the length of a substring
  - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
    - extract a substring of length `num_chars` from `string` starting at `starting_index`
    - append the extracted substring to the `result` array
    - increment the `num_chars` variable by `1`
  - end the inner loop
  - increment the `starting_index` variable by `1`
- end the outer loop
- return the `result` array

*is_palindrome? method*
- Inside the `is_palindrome?` method, check whether the string
  value is equal to its reversed value. You can use the
  String# reverse method.

*palindrome_substrings method*
 - initialize a result variable to an empty array
 - create an array named substring_arr that contains all of the
   substrings of the input string that are at least 2 characters long.
 - loop through the words in the substring_arr array.
 - if the word is a palindrome, append it to the result
   array
 - return the result array

##### **FORMAL PSEUDOCODE:**
```ruby
# START
#
#   /* Given a string named `string` */
#
#   SET result = []
#   SET starting_index = 0
#
#   WHILE starting_index <= length of string - 2
#     SET num_chars = 2
#     WHILE num_chars <= length of string - starting_index
#       SET substring = num_chars characters from string starting at index starting_index
#       append substring to result array
#       SET num_chars = num_chars + 1
#
#     SET starting_index = starting_index + 1
#
#   RETURN result
#
# END
```

##### **RUBY CODE:**
```ruby
def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []
```