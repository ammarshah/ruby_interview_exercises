# Validate parentheses meaning every opening parenthesis should also close somewhere.

=begin
  Example:
    "(())()()" should return "VALID PARENTHESES".
    ")()()"    should return "INVALID PARENTHESES: Missing opening parenthesis".
    "()(()"    should return "INVALID PARENTHESES: Missing closing parenthesis".
=end

def validate_parentheses(parentheses_str)
  validity = 0

  parentheses_str.each_char do |parenthesis|
    if parenthesis == ')'
      validity -= 1
      return "INVALID PARENTHESES: Missing opening parenthesis" if validity < 0
    elsif parenthesis == "("
      validity += 1
    end
  end

  validity > 0 ? "INVALID PARENTHESES: Missing closing parenthesis" : "VALID PARENTHESES"
end
