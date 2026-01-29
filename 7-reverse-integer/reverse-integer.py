class Solution(object):
    def reverse(self, x):
        INT_MAX = 2**31 - 1  # 2147483647
        INT_MIN = -2**31     # -2147483648

        # Determine the sign of the input and work with its absolute value
        is_negative = x < 0
        num = abs(x)
        
        reversed_num = 0

        # Loop to extract digits and build the reversed number
        while num > 0:
            digit = num % 10  
            num //= 10        
            if reversed_num > INT_MAX // 10:
                return 0
            
            
            if reversed_num == INT_MAX // 10 and digit > INT_MAX % 10: 
                return 0

            # Build the reversed number
            reversed_num = reversed_num * 10 + digit

        # Apply the original sign
        final_result = -reversed_num if is_negative else reversed_num

        
        if not (INT_MIN <= final_result <= INT_MAX):
            return 0
            
        return final_result
        