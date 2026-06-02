# Write a program to convert a delimitted string to an array of strings.

# Examples:

# Input: split_on_delimiter("....this...is.a.delimitted.string...", ".")
# Output: ["this", "is", "a", "delimitted", "string"]

# Input: split_on_delimiter("hello world", " ")
# Output: ["hello", "world"]

# Input: split_on_delimiter("a--b---c----d", "--")
# Output: ["a", "b", "-c", "d"]

def split_on_delimiter(str, delimiter)
  return [str] if delimiter.empty?
  str.split(delimiter).reject(&:empty?)
end
