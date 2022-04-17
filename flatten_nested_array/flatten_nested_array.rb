# Write a program to flatten nested array.

# Sample input: [1, [2, 3, [4, 5, [6, 7]]], 8, [9, 10]]
# Expected output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


# HACKY VERSION
@flattened_array = []
def recursive_array_flattener(nested_array)
    nested_array.each do |element|
        if element.is_a?(Array)
            recursive_array_flattener(element)
        else
            @flattened_array << element
        end
    end
    @flattened_array
end

# CLEAN VERSION
def recursive_array_flattener(nested_array)
    flattened_array = []
    nested_array.each do |element|
        if element.is_a?(Array)
            flattened_array.concat(recursive_array_flattener(element))
        else
            flattened_array << element
        end
    end
    flattened_array
end

# CLEANER VERSION
def recursive_array_flattener(nested_array)
    nested_array.each_with_object([]) do |element, flattened_array|
        if element.is_a?(Array)
            flattened_array.concat(recursive_array_flattener(element))
        else
            flattened_array << element
        end
    end
end

# Some inputs
nested_array_input = [1, [2, 3, [4, 5, [6, 7]]], 8, [9, 10]]
nested_array_input_1 = [1, [[2, 3], [4, 5], [6, 7]], 8, [9, 10, 11]]
nested_array_input_2 = [[[[[1, 2, 3]]]]]

# Call the function
puts recursive_array_flattener(nested_array_input).inspect