# Given a string, write a program to check if that string is Pangram or not, and calculate the missing letters.

# A pangram is a sentence containing every letter in the English Alphabet.

# Examples:

# Input : abcdefghijklmnopqxyz
# Output : is_pangram: false / missing_letters: ["r", "s", "t", "u", "v", "w"]

# Input : The quick brown fox jumps over the lazy dog!
# Output: is_pangram: true / missing_letters: []

def is_pangram?(str)
  missing_letters = ('a'..'z').to_a - str.downcase.chars
  missing_letters.empty?
end
