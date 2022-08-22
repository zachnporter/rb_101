```
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]
```

| Line | Action |	Object | Side Effect | Return Value | Is Return Value Used? |
| :--- | :---   | :---   | :---        | :---         | :---                  |
| 1 | method call `map` | Outer array | None | New Array `[1, 3]` | No |
| 1-4 | block execution | Each sub-array | None | Integer at index zero of each sub-array | Yes, by `map` for transformation |
| 2 | method call `first` | Each sub-array | None | Element at index zero of each sub-array | Yes, by `puts` |
| 2 | method call `puts` | Integer at index zero of each sub-array | Outputs string representation of integer | `nil` | No |
| 3 | method call `first` | Each sub-array | None | Element at index zero of each sub-array | Yes, to determine return value of the block
<br><br>

```
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
# => [[18, 7], [3, 12]]
```

| Line | Action |	Object | Side Effect | Return Value | Is Return Value Used? |
| :--- | :---   | :---   | :---        | :---         | :---                  |
| 1 | variable assignment `my_arr` | `[[18, 7], [3, 12]]` | None | `[[18, 7], [3, 12]]` | No |
| 1 | method call `each` | Outer array | None | The calling object: `[[18, 7], [3, 12]]` | Yes, used for variable assignment to `my_arr` |
| 1-7 | outer block execution | Each sub-array | None | Each sub-array | No |
| 2 | method call `each` | Each sub-array | None | The calling object: sub-array in current iteration | Yes, used to determine return value of outer block | 
| 2-6 | inner block execution | Each element of sub-array | None | `nil` | No |
| 3 | comparison `>` | Each element of sub-array | None | Boolean | Yes, evaluated by `if` |
| 3-5 | conditional `if` | The result of the expression `num > 5` | None | `nil` | Yes, used to determine return value of inner block |  
| 4 | method call `puts` | Element of sub array `> 5` | Outputs string representation of integer | `nil` | Yes, used to determine the return value of the conditional statement if the condition is met |
<br><br>

```
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]
```

| Line | Action |	Object | Side Effect | Return Value | Is Return Value Used? |
| :--- | :---   | :---   | :---        | :---         | :---                  |
| 1 | method call `map` | Original array | None | New transformed array | No |
| 1-5 | outer block execution | Each sub-array | None | New transformed array | Yes, used by top-level `map` for transformation |
| 2 | method call `map` | Each sub-array | None | New transformed array | Yes, used to determine return value of outer block | 
| 2-4 | inner block execution | Each element of sub-array | None | Integer | Yes, used by inner `map` for transformation |
| 3 | method call `*` with integer `2` as an argument | Each element of sub-array | None | Integer | Yes, used to determine return value of inner block |