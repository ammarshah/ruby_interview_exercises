# Given a string, write a program to check if that string is Pangram or not, and calculate the missing letters.

# A pangram is a sentence containing every letter in the English Alphabet.

# Examples:

# Input : abcdefghijklmnopqxyz
# Output : is_pangram: false / missing_letters: ["r", "s", "t", "u", "v", "w"]

# Input : The quick brown fox jumps over the lazy dog!
# Output: is_pangram: true / missing_letters: []

class Pangram
    ENGLISH_ALPHABETS = ('a'..'z').to_a

    def initialize(str)
        @str = str
    end

    def missing_pangram_letters
        ENGLISH_ALPHABETS - @str.downcase.chars
    end

    def is_pangram?
        missing_pangram_letters.empty? # Empty array means it's a pangram
    end
end

str = "abcdefghijklmnopqxyz"
obj = Pangram.new(str)
p obj.is_pangram? # => false
p obj.missing_pangram_letters # => ["r", "s", "t", "u", "v", "w"]

sentence = "The quick brown fox jumps over the lazy dog!"
obj2 = Pangram.new(sentence)
p obj2.is_pangram? # => true
p obj2.missing_pangram_letters # => []
