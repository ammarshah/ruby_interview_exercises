# Write a method to remove duplicate characters from a string.

def remove_duplicate_characters(str)
  str.chars.uniq.join
end
