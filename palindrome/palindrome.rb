# Write a function to verify if the given string is a palindrome.

# A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward as forward.
# For example, "madam" is a palindrome.

# The function should return true if the string is a palindrome, and false otherwise.
# The function should ignore spaces, punctuation, and capitalization.

# For example
# "Madam, I'm Adam!" is a palindrome.

def is_palindrome?(string)
  cleaned_string = string.gsub(/[^a-zA-Z0-9]/, '').downcase
  cleaned_string == cleaned_string.reverse
end
