# Validate parentheses meaning every opening parenthesis should also close somewhere.

=begin
    Example: "(())()()" should return "VALID PARENTHESES" message.
             ")()()" should return "INVALID PARENTHESES: Missing opening parenthesis".
             "()(()" should return "INVALID PARENTHESES: Missing closing parenthesis".
=end

def validate_parentheses(parentheses_string)
    # Declare a `validity` variable with an initial value of 0
        # 0 = "VALID PARENTHESES"
        # Any -ve value = "INVALID PARENTHESES: Missing opening parenthesis"
        # Any +ve value = "INVALID PARENTHESES: Missing closing parenthesis"
    validity = 0

    # Iterate through each character in the `parentheses_string`
    parentheses_string.each_char do |char|
        # If the character is equal to ")"
        if char == ')'
            # Decrement 1 in the `validity` variable
            validity -= 1
            
            # If the `validity` variable is < 0 then return "INVALID PARENTHESES: Missing opening parenthesis"
            return "INVALID PARENTHESES: Missing opening parenthesis" if validity < 0
        
        # Else if the character is equal to "("
        elsif char == "("
            # Increment 1 in the `validity` variable
            validity += 1
        end
    end
        
    # If the `validity` variable is equal to 0
    if validity == 0
        return "VALID PARENTHESES"
    # Else if the `validity` variable is > 0
    elsif validity > 0
        return "INVALID PARENTHESES: Missing closing parenthesis"
    end
end

# Some inputs
valid_parentheses = "(())()()"
valid_parentheses_1 = "(((()))(()))"
invalid_parentheses = ")()()"
invalid_parentheses_2 = "()(()"
invalid_parentheses_3 = "()(()))()"
invalid_parentheses_4 = "))(("

# Call the function
puts validate_parentheses(valid_parentheses)