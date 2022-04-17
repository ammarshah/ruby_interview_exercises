module NumberInWords
    DICTIONARY = {
        '0' => 'zero',
        '1' => 'one',
        '2' => 'two',
        '3' => 'three',
        '4' => 'four',
        '5' => 'five',
        '6' => 'six',
        '7' => 'seven',
        '8' => 'eight',
        '9' => 'nine',
        '10' => 'ten',
        '11' => 'eleven',
        '12' => 'twelve',
        '13' => 'thirteen',
        '14' => 'fourteen',
        '15' => 'fifteen',
        '16' => 'sixteen',
        '17' => 'seventeen',
        '18' => 'eighteen',
        '19' => 'nineteen',
        '20' => 'twenty',
        '30' => 'thirty',
        '40' => 'forty',
        '50' => 'fifty',
        '60' => 'sixty',
        '70' => 'seventy',
        '80' => 'eighty',
        '90' => 'ninety'
    }

    UNITS_PLACE = {
        0 => '',
        1 => 'unit',
        2 => 'ten',
        3 => 'hundred',
        4 => 'thousand',
        5 => 'ten thousand',
        6 => 'hundred thousand',
        7 => 'million',
        8 => 'ten million',
        9 => 'hundred million',
        10 => 'billion',
        11 => 'ten billion',
        12 => 'hundred billion',
        13 => 'trillion',
        14 => 'ten trillion',
        15 => 'hundred trillion',
        16 => 'quadrillion',
        17 => 'ten quadrillion',
        18 => 'hundred quadrillion',
        19 => 'quintillion',
        20 => 'ten quintillion',
        21 => 'hundred quintillion',
        22 => 'sextillion',
        23 => 'ten sextillion',
        24 => 'hundred sextillion',
        25 => 'septillion',
        26 => 'ten septillion',
        27 => 'hundred septillion',
        28 => 'octillion',
        29 => 'ten octillion',
        30 => 'hundred octillion',
        31 => 'nonillion',
        32 => 'ten nonillion',
        33 => 'hundred nonillion',
        34 => 'decillion',
        35 => 'ten decillion',
        36 => 'hundred decillion',
        37 => 'undecillion',
        38 => 'ten undecillion',
        39 => 'hundred undecillion',
        40 => 'duodecillion',
        41 => 'ten duodecillion',
        42 => 'hundred duodecillion',
        43 => 'tredecillion',
        44 => 'ten tredecillion',
        45 => 'hundred tredecillion',
        46 => 'quattuordecillion',
        47 => 'ten quattuordecillion',
        48 => 'hundred quattuordecillion',
        49 => 'quindecillion',
        50 => 'ten quindecillion',
        51 => 'hundred quindecillion',
        52 => 'sexdecillion',
        53 => 'ten sexdecillion',
        54 => 'hundred sexdecillion',
        55 => 'septemdecillion',
        56 => 'ten septemdecillion',
        57 => 'hundred septemdecillion',
        58 => 'octodecillion',
        59 => 'ten octodecillion',
        60 => 'hundred octodecillion',
        61 => 'novemdecillion',
        62 => 'ten novemdecillion',
        63 => 'hundred novemdecillion',
        64 => 'vigintillion',
        65 => 'ten vigintillion',
        66 => 'hundred vigintillion',
        67 => 'unvigintillion',
        68 => 'ten unvigintillion',
        69 => 'hundred unvigintillion',
        70 => 'duovigintillion',
        71 => 'ten duovigintillion',
        72 => 'hundred duovigintillion',
        73 => 'trevigintillion',
        74 => 'ten trevigintillion',
        75 => 'hundered trevigintillion',
        76 => 'quattuorvigintillion',
        77 => 'ten quattuorvigintillion',
        78 => 'hundred quattuorvigintillion',
        79 => 'quinvigintillion',
        80 => 'ten quinvigintillion',
        81 => 'hundred quinvigintillion',
        82 => 'sexvigintillion',
        83 => 'ten sexvigintillion',
        84 => 'hundred sexvigintillion',
        85 => 'septvigintillion',
        86 => 'ten septvigintillion',
        87 => 'hundred septvigintillion',
        88 => 'octovigintillion',
        89 => 'ten octovigintillion',
        90 => 'hundred octovigintillion',
        91 => 'nonvigintillion',
        92 => 'ten nonvigintillion',
        93 => 'hundred nonvigintillion',
        94 => 'trigintillion',
        95 => 'ten trigintillion',
        96 => 'hundred trigintillion',
        97 => 'untrigintillion',
        98 => 'ten untrigintillion',
        99 => 'hundred untrigintillion',
        100 => 'duotrigintillion',
        101 => 'ten duotrigintillion',
        102 => 'hundred duotrigintillion'
    }

    refine Integer do
        def in_words(titleize: false, add_and: false)
            number_str = self.to_s

            # Return the word if the number already exists in the DICTIONARY
            if DICTIONARY.has_key?(number_str)
                return titleize ? NumberInWords.titleize(DICTIONARY[number_str]) : DICTIONARY[number_str]
            end

            # Separate number_str into an array with chunks of three digits
            chunks_array = NumberInWords.convert_string_into_chunks_of_max_three_digits(number_str)

            # Get final string
            final_string = NumberInWords.convert_all_chunks_into_words(chunks_array)

            # Titleize the final string
            final_string = NumberInWords.titleize(final_string) if titleize

            # Adds a word "and" at the right place
            final_string = NumberInWords.add_and(final_string) if add_and

            return final_string
        end
    end

    private

    # Sample input: ('12345001')        => Expected output: ['12', '345', '001']
    def NumberInWords.convert_string_into_chunks_of_max_three_digits(str)
        # Start adding consecutive three digits from the end of the string to have them placed properly
        reversed = str.reverse # => '10054321'
        reversed_digits_in_each_chunk = reversed.gsub(/(.{3})/, '\1 \2').split(' ') # => ['100', '543', '21']
        unreversed_digits_in_each_chunk = reversed_digits_in_each_chunk.map {|chunk| chunk.reverse } # => ['001', '345', '12']
        return unreversed_digits_in_each_chunk.reverse # => ['12', '345', '001']
    end

    # Sample input: (['12', '345', '001'])        => Expected output: 'twelve million three hundred forty-five thousand one'
    def NumberInWords.convert_all_chunks_into_words(chunks_array)
        total_digits = chunks_array.join('').size
        offset = 0
        array_of_words = []
        
        chunks_array.each do |chunk|
            first_digit_unit_place_value = total_digits - offset
            array_of_words << NumberInWords.chunk_resolver(chunk: chunk, first_digit_unit_place_value: first_digit_unit_place_value)
            offset += chunk.size
        end

        # Remove all nil values from array and convert into single string
        final_string = array_of_words.compact.join(' ')

        return final_string
    end

    # Sample input: (chunk: '10',   first_digit_unit_place_value: 2)              => Expected output: 'ten'
    # Sample input: (chunk: '42',   first_digit_unit_place_value: 2)              => Expected output: 'forty-two'
    # Sample input: (chunk: '000',  first_digit_unit_place_value: 3)              => Expected output: nil
    # Sample input: (chunk: '001',  first_digit_unit_place_value: 3)              => Expected output: 'one'
    # Sample input: (chunk: '010',  first_digit_unit_place_value: 3)              => Expected output: 'ten'
    # Sample input: (chunk: '011',  first_digit_unit_place_value: 3)              => Expected output: 'eleven'
    # Sample input: (chunk: '100',  first_digit_unit_place_value: 3)              => Expected output: 'one hundred'
    # Sample input: (chunk: '101',  first_digit_unit_place_value: 3)              => Expected output: 'one hundred one'
    # Sample input: (chunk: '110',  first_digit_unit_place_value: 3)              => Expected output: 'one hundred ten'
    # Sample input: (chunk: '111',  first_digit_unit_place_value: 3)              => Expected output: 'one hundred eleven'
    # Sample input: (chunk: '345',  first_digit_unit_place_value: 3)              => Expected output: 'three hundred forty-five'
    # Sample input: (chunk: '1',    first_digit_unit_place_value: 4)              => Expected output: 'one thousand'
    # Sample input: (chunk: '10',   first_digit_unit_place_value: 5)              => Expected output: 'ten thousand'
    # Sample input: (chunk: '21',   first_digit_unit_place_value: 5)              => Expected output: 'twenty-one thousand'
    # Sample input: (chunk: '000',  first_digit_unit_place_value: 6)              => Expected output: nil
    # Sample input: (chunk: '001',  first_digit_unit_place_value: 6)              => Expected output: 'one thousand'
    # Sample input: (chunk: '010',  first_digit_unit_place_value: 6)              => Expected output: 'ten thousand'
    # Sample input: (chunk: '100',  first_digit_unit_place_value: 6)              => Expected output: 'one hundred thousand'
    # Sample input: (chunk: '101',  first_digit_unit_place_value: 6)              => Expected output: 'one hundred one thousand'
    # Sample input: (chunk: '111',  first_digit_unit_place_value: 6)              => Expected output: 'one hundred eleven thousand'
    # Sample input: (chunk: '121',  first_digit_unit_place_value: 6)              => Expected output: 'one hundred twenty-one thousand'
    def NumberInWords.chunk_resolver(chunk:, first_digit_unit_place_value:)
        # Remove leading zeros, if any, and get updated first_digit_unit_place_value
        hash = NumberInWords.chunk_and_unit_place_value_corrector(chunk: chunk, first_digit_unit_place_value: first_digit_unit_place_value)
        return nil if hash.nil?

        chunk = hash[:chunk]
        first_digit_unit_place_value = hash[:first_digit_unit_place_value]
        units_array = UNITS_PLACE[first_digit_unit_place_value].split(' ')

        if units_array.first == 'unit'
            NumberInWords.unit_resolver(digit_str: chunk)
        elsif units_array.first == 'ten'
            if units_array.size > 1 # When units_array = ['ten', 'thousand']
                NumberInWords.ten_resolver(number_str: chunk, unit: units_array.last)
            else
                NumberInWords.ten_resolver(number_str: chunk) # When units_array = ['ten']
            end
        elsif units_array.first == 'hundred'
            NumberInWords.hundred_resolver(number_str: chunk, units_array: units_array)
        else
            NumberInWords.unit_resolver(digit_str: chunk, unit: units_array.first) # When units_array.first = 'thousand', 'million', 'billion' and so on...
        end
    end

    # Sample input: (chunk: '10',   first_digit_unit_place_value: 2)         => Expected output: {:chunk=>"10", :first_digit_unit_place_value=>2}
    # Sample input: (chunk: '42',   first_digit_unit_place_value: 2)         => Expected output: {:chunk=>"42", :first_digit_unit_place_value=>2}
    # Sample input: (chunk: '000',  first_digit_unit_place_value: 3)         => Expected output: nil
    # Sample input: (chunk: '001',  first_digit_unit_place_value: 3)         => Expected output: {:chunk=>"1", :first_digit_unit_place_value=>1}
    # Sample input: (chunk: '010',  first_digit_unit_place_value: 3)         => Expected output: {:chunk=>"10", :first_digit_unit_place_value=>2}
    # Sample input: (chunk: '011',  first_digit_unit_place_value: 3)         => Expected output: '{:chunk=>"11", :first_digit_unit_place_value=>2}
    # Sample input: (chunk: '100',  first_digit_unit_place_value: 3)         => Expected output: {:chunk=>"100", :first_digit_unit_place_value=>3}
    # Sample input: (chunk: '101',  first_digit_unit_place_value: 3)         => Expected output: {:chunk=>"101", :first_digit_unit_place_value=>3}
    # Sample input: (chunk: '110',  first_digit_unit_place_value: 3)         => Expected output: {:chunk=>"110", :first_digit_unit_place_value=>3}
    # Sample input: (chunk: '111',  first_digit_unit_place_value: 3)         => Expected output: {:chunk=>"111", :first_digit_unit_place_value=>3}
    # Sample input: (chunk: '345',  first_digit_unit_place_value: 3)         => Expected output: {:chunk=>"345", :first_digit_unit_place_value=>3}
    # Sample input: (chunk: '1',    first_digit_unit_place_value: 4)         => Expected output: {:chunk=>"1", :first_digit_unit_place_value=>4}
    # Sample input: (chunk: '10',   first_digit_unit_place_value: 5)         => Expected output: {:chunk=>"10", :first_digit_unit_place_value=>5}
    # Sample input: (chunk: '21',   first_digit_unit_place_value: 5)         => Expected output: {:chunk=>"21", :first_digit_unit_place_value=>5}
    # Sample input: (chunk: '000',  first_digit_unit_place_value: 6)         => Expected output: nil
    # Sample input: (chunk: '001',  first_digit_unit_place_value: 6)         => Expected output: {:chunk=>"1", :first_digit_unit_place_value=>4}
    # Sample input: (chunk: '010',  first_digit_unit_place_value: 6)         => Expected output: {:chunk=>"10", :first_digit_unit_place_value=>5}
    # Sample input: (chunk: '100',  first_digit_unit_place_value: 6)         => Expected output: {:chunk=>"100", :first_digit_unit_place_value=>6}
    # Sample input: (chunk: '101',  first_digit_unit_place_value: 6)         => Expected output: {:chunk=>"101", :first_digit_unit_place_value=>6}
    # Sample input: (chunk: '111',  first_digit_unit_place_value: 6)         => Expected output: {:chunk=>"111", :first_digit_unit_place_value=>6}
    # Sample input: (chunk: '121',  first_digit_unit_place_value: 6)         => Expected output: {:chunk=>"121", :first_digit_unit_place_value=>6}
    def NumberInWords.chunk_and_unit_place_value_corrector(chunk:, first_digit_unit_place_value:)
        leading_zeros_removed_chunk = chunk.to_i.to_s # '005' => '5'
        return nil if leading_zeros_removed_chunk == '0'
        if leading_zeros_removed_chunk.size < chunk.size # 1 < 3
            first_digit_unit_place_value = first_digit_unit_place_value - (chunk.size - leading_zeros_removed_chunk.size) # 6-(3-1) = 4
        end
        return { chunk: leading_zeros_removed_chunk, first_digit_unit_place_value: first_digit_unit_place_value }
    end

    # Sample input: (digit_str: '0')                        => Expected output: 'zero'
    # Sample input: (digit_str: '5')                        => Expected output: 'five'
    # Sample input: (digit_str: '2', unit: 'hundred')       => Expected output: 'two hundred'
    def NumberInWords.unit_resolver(digit_str:, **options)
        digit_in_word = DICTIONARY[digit_str]
        unit = options[:unit]
        return "#{digit_in_word} #{unit}".strip
    end

    # Sample input: (number_str: '00')                          => Expected output: nil
    # Sample input: (number_str: '00', unit: 'thousand')        => Expected output: 'thousand'
    # Sample input: (number_str: '01')                          => Expected output: 'one'
    # Sample input: (number_str: '10')                          => Expected output: 'ten'
    # Sample input: (number_str: '11')                          => Expected output: 'eleven'
    # Sample input: (number_str: '21')                          => Expected output: 'twenty-one'
    # Sample input: (number_str: '50', unit: 'thousand')        => Expected output: 'fifty thousand'
    def NumberInWords.ten_resolver(number_str:, **options)
        # Convert number_str to NumberInWords and then back to string in case the input is '00' or '01'
        number_str = number_str.to_i.to_s
        if number_str == '0'
            return nil if options[:unit].nil?
            number_in_words = ''
        else
            number_in_words = DICTIONARY.has_key?(number_str) ?
                                        DICTIONARY[number_str] : 
                                        DICTIONARY[number_str[0] + '0'] + '-' + DICTIONARY[number_str[1]]
        end
        unit = options[:unit]
        return "#{number_in_words} #{unit}".strip
    end

    # Sample input: (number_str: '1',   units_array: ['hundred'])                     => Expected output: 'one hundred'
    # Sample input: (number_str: '100', units_array: ['hundred'])                     => Expected output: 'one hundred'
    # Sample input: (number_str: '101', units_array: ['hundred'])                     => Expected output: 'one hundred one'
    # Sample input: (number_str: '110', units_array: ['hundred'])                     => Expected output: 'one hundred ten'
    # Sample input: (number_str: '119', units_array: ['hundred'])                     => Expected output: 'one hundred nineteen'
    # Sample input: (number_str: '121', units_array: ['hundred'])                     => Expected output: 'one hundred twenty-one'
    # Sample input: (number_str: '100', units_array: ['hundred', 'thousand'])         => Expected output: 'one hundred thousand'
    # Sample input: (number_str: '101', units_array: ['hundred', 'thousand'])         => Expected output: 'one hundred one thousand'
    # Sample input: (number_str: '121', units_array: ['hundred', 'thousand'])         => Expected output: 'one hundred twenty-one thousand'
    def NumberInWords.hundred_resolver(number_str:, units_array:)
        words = [
                    NumberInWords.unit_resolver(digit_str: number_str[0], unit: units_array[0]),
                    NumberInWords.ten_resolver(number_str: number_str[1,2], unit: units_array[1])
                ].compact
        return words.join(' ').strip
    end

    # Sample input: ("twenty-two")                  => Expected output: "Twenty-Two"
    # Sample input: ("one hundred")                 => Expected output: "One Hundred"
    # Sample input: ("one hundred one")             => Expected output: "One Hundred One"
    # Sample input: ("one hundred twenty-one")      => Expected output: "One Hundred Twenty-One"
    def NumberInWords.titleize(string)
        string.gsub(/\w+/, &:capitalize)
    end

    # Sample input: ("one hundred one")                                 => Expected output: "One Hundred and One"
    # Sample input: ("one hundred twenty-one")                          => Expected output: "One Hundred and Twenty-One"
    # Sample input: ("one million one hundred ten")                     => Expected output: "One Million One Hundred and Ten"
    # Sample input: ("one hundred fifty thousand two hundred one")      => Expected output: "One Hundred Fifty Thousand Two Hundred and One"
    # Sample input: ("one hundred thousand")                            => Expected output: "One Hundred Thousand"
    # Sample input: ("one million one hundred")                         => Expected output: "One Million and One Hundred"
    # Sample input: ("two hundred ten thousand")                        => Expected output: "Two Hundred and Ten Thousand"
    # Sample input: ("one hundred fifty-one thousand")                  => Expected output: "One Hundred and Fifty-One Thousand"
    # Sample input: ("one hundred fifty thousand two hundred")          => Expected output: "One Hundred Fifty Thousand and Two Hundred"
    # Sample input: ("one million two hundred thousand")                => Expected output: "One Million and Two Hundred Thousand"
    def NumberInWords.add_and(string)
        words_array = string.split(' ')
        number_of_words = words_array.size

        if number_of_words > 2 and NumberInWords.last_word_exists_in_dictionary?(words_array) # "one hundred twenty-one"
            words_array.insert(number_of_words - 1, "and") # Add "and" before last word
        elsif number_of_words > 3
            if NumberInWords.second_last_word_exists_in_dictionary?(words_array) # "two hundred ten thousand"
                words_array.insert(number_of_words - 2, "and") # Add "and" before second last word
            elsif NumberInWords.third_last_word_exists_in_dictionary?(words_array) # "one million two hundred thousand"
                words_array.insert(number_of_words - 3, "and") # Add "and" before third last word
            end
        end
        words_array.join(' ')
    end

    # Sample input: (["one", "hundred", "ten"])                     => Expected output: true
    # Sample input: (["one", "hundred", "twenty-one"])              => Expected output: true
    # Sample input: (["one", "hundred", "thousand"])                => Expected output: false
    # Sample input: (["one", "hundred", "ten", "thousand"])         => Expected output: false
    # Sample input: (["one", "hundred", "ten", "thousand"])         => Expected output: false
    def NumberInWords.last_word_exists_in_dictionary?(words_array)
        last_word = words_array.last
        NumberInWords.value_exists_in_dictionary?(last_word)
    end


    # Sample input: (["one", "hundred", "ten", "thousand"])                         => Expected output: true
    # Sample input: (["one", "hundred", "twenty-five", "thousand"])                 => Expected output: true
    # Sample input: (["one", "million", "one", "hundred", "ten", "thousand"])       => Expected output: true
    # Sample input: (["one", "million", "one", "hundred", "thousand"])              => Expected output: false
    def NumberInWords.second_last_word_exists_in_dictionary?(words_array)
        number_of_words = words_array.size
        second_last_word = words_array[number_of_words - 2]
        NumberInWords.value_exists_in_dictionary?(second_last_word)
    end

    # Sample input: (["one", "hundred", "ten", "thousand"])                         => Expected output: false
    # Sample input: (["one", "hundred", "twenty-five", "thousand"])                 => Expected output: false
    # Sample input: (["one", "million", "one", "hundred", "ten", "thousand"])       => Expected output: false
    # Sample input: (["one", "million", "one", "hundred", "thousand"])              => Expected output: true
    def NumberInWords.third_last_word_exists_in_dictionary?(words_array)
        number_of_words = words_array.size
        third_last_word = words_array[number_of_words - 3]
        NumberInWords.value_exists_in_dictionary?(third_last_word)
    end

    # Sample input: ("one")                => Expected output: true
    # Sample input: ("ten")                => Expected output: true
    # Sample input: ("twenty-one")         => Expected output: true
    # Sample input: ("hundred")            => Expected output: false
    # Sample input: ("million")            => Expected output: false
    def NumberInWords.value_exists_in_dictionary?(value)
        DICTIONARY.has_value?(value.split('-').last.downcase)
    end
end
