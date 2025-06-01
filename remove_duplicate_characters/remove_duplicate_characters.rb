# Write a method to remove duplicate characters from a string.

def remove_duplicate_characters(str)
  str.chars.uniq.join
end

puts remove_duplicate_characters("hello") # Output: "helo"
puts remove_duplicate_characters("aabbcc") # Output: "abc"
puts remove_duplicate_characters("abcdef") # Output: "abcdef"
puts remove_duplicate_characters("") # Output: ""
