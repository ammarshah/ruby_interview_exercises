# Write a program to flatten nested arrays of arbitrary depth into a single flat array.

# Sample input: [1, [2, 3, [4, 5, [6, 7]]], 8, [9, 10]]
# Expected output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def nested_array_flattener(nested_array)
  nested_array.each_with_object([]) do |element, flattened_array|
    if element.is_a?(Array)
      flattened_array.concat(nested_array_flattener(element))
    else
      flattened_array << element
    end
  end
end
