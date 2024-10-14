# Computer_Architecture
### Problem
Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.

 
- **Example 1:**
    Input: num = 38
    Output: 2
    Explanation: The process is
    38 --> 3 + 8 --> 11
    11 --> 1 + 1 --> 2 
    Since 2 has only one digit, return it.
- **Example 2:**
    Input: num = 199
    Output: 1
    ## Solution

### Idea for problem solving

1. **Digit extraction and summation:**
   - The function repeatedly extracts the digits of the integer `num` and sums them. This is done by using the operation `num % 10` to get the last digit of `num`, and then adding it to `sum` with `sum += num % 10`.
   - After extracting the last digit, the number is divided by 10 (`num /= 10`) to remove the last digit, and the process is repeated until `num` becomes 0.

2. **Repeat until a single-digit result:**
   - After summing all the digits of `num`, the resulting sum might still be a two-digit number or larger. In this case, the function checks if `sum > 9`.
   - If `sum` is greater than 9, the function recursively calls itself with `sum` as the new input (`addDigits(sum)`), repeating the digit extraction and summation process on the new `sum`.
   - If `sum <= 9`, the function returns the sum as the final result, because it’s already a single-digit number.

3. **Base case/termination condition:**
   - When the sum of digits is less than or equal to 9, the recursion stops, and the function returns this result as it is already a single-digit number.
