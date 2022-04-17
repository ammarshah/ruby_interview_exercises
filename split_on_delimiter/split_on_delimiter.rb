# converts a delimitted string to an array of strings
def split(string="", delimiter)
    array = []
    index = 0

    for char_index in 0...string.length # read each character in the `string` using a for loop
        if string[char_index] == delimiter # incase of delimiter, add 1 to the index of the array variable
            index += 1 unless array[index].nil? # only add 1 to the `index` if the 0th index of the `array` is not nil
        else
            if array[index].nil? # if this `index` of the `array` is nil then
                array[index] = string[char_index] # push the character to that `index` of the `array`
            else # if this `index` of the `array` already has a character then
                array[index] += string[char_index] # append the character on that `index` of the `array`
            end
        end
    end
    
    array
end

puts split("....this...is.a.delimitted.string...", ".").inspect
