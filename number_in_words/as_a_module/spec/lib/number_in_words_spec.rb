require 'spec_helper'
require 'number_in_words'

RSpec.describe NumberInWords do
    subject { described_class }

    it 'has a DICTIONARY hash constant defined' do
        expect(subject).to have_constant(:DICTIONARY, Hash)
    end

    it 'has a UNITS_PLACE hash constant defined' do
        expect(subject).to have_constant(:UNITS_PLACE, Hash)
    end

    context 'has a DICTIONARY hash constant' do
        let(:dictionary) { NumberInWords::DICTIONARY }

        it 'with exactly 28 key-value pairs' do
            expect(dictionary.size).to eq(28)
        end
    
        it 'starts with "0": "zero"' do
            first_key_value_pair = [dictionary.first].to_h
            expect(first_key_value_pair).to eq("0" => "zero")
        end
    
        it 'ends with "90": "ninety"' do
            last_key_value_pair = [dictionary.to_a.last].to_h
            expect(last_key_value_pair).to eq("90" => "ninety")
        end
    end

    context 'has a UNITS_PLACE hash constant' do
        let(:units_place) { NumberInWords::UNITS_PLACE }

        it 'with exactly 103 key-value pairs' do
            expect(units_place.size).to eq(103)
        end

        it 'starts with 0 => ""' do
            first_key_value_pair = [units_place.first].to_h
            expect(first_key_value_pair).to eq(0 => "")
        end

        it 'ends with 102 => "hundred duotrigintillion"' do
            last_key_value_pair = [units_place.to_a.last].to_h
            expect(last_key_value_pair).to eq(102 => "hundred duotrigintillion")
        end
    end

    describe '.in_words' do
        context 'when no arguments given' do
            it 'raises an ArgumentError exception' do
                expect{ NumberInWords.in_words }.to raise_exception(ArgumentError)
            end
        end

        context 'when valid number of arguments given' do
            it 'requires one mandatory argument' do
                expect(subject).to respond_to(:in_words).with(1).argument
            end

            it 'accepts an optional "titleize" boolean keyword argument' do
                expect(subject).to respond_to(:in_words).with(1).argument.and_keywords(:titleize)
            end

            it 'accepts an optional "add_and" boolean keyword argument' do
                expect(subject).to respond_to(:in_words).with(1).argument.and_keywords(:add_and)
            end

            it 'accepts max one mandatory and two optional keyword arguments' do
                expect(subject).to respond_to(:in_words).with(1).argument.and_keywords(:titleize, :add_and)
            end
        end

        context 'when valid types of first mandatory argument given' do
            it 'should accept an integer type' do
                expect(NumberInWords.in_words(5)).to eq("five")
            end

            it 'should accept a string type' do
                expect(NumberInWords.in_words("5")).to eq("five")
            end
        end

        context 'when invalid types of first mandatory argument given' do
            it 'should return an error for a boolean type' do
                expect(NumberInWords.in_words(true)).to eq("Number should only be of an Integer or a String type")
            end

            it 'should return an error for a float type' do
                expect(NumberInWords.in_words(5.2)).to eq("Number should only be of an Integer or a String type")
            end
        end

        context 'when valid arguments given' do
            def self.test_in_words(input_number, expected_output_in_words, titleize: false, add_and: false)
                it "converts \"#{input_number}\" into \"#{expected_output_in_words}\" with titleize: (#{titleize}) and add_and (#{add_and})" do
                    expect(NumberInWords.in_words(input_number, titleize: titleize, add_and: add_and)).to eq(expected_output_in_words)
                end
            end

            test_in_words 0, 'zero'
            test_in_words 1, 'one'
            test_in_words 2, 'Two', titleize: true
            test_in_words 3, 'three', add_and: true
            test_in_words 4, 'Four', titleize: true, add_and: true
            test_in_words 5, 'five'
            test_in_words 6, 'six'
            test_in_words 7, 'seven'
            test_in_words 8, 'eight'
            test_in_words 9, 'nine'
            test_in_words 10, 'ten'
            test_in_words 11, 'Eleven', titleize: true
            test_in_words 12, 'twelve'
            test_in_words 13, 'thirteen'
            test_in_words 14, 'fourteen'
            test_in_words 15, 'fifteen'
            test_in_words 16, 'sixteen'
            test_in_words 17, 'seventeen'
            test_in_words 18, 'eighteen'
            test_in_words 19, 'nineteen'
            test_in_words 20, 'twenty'
            test_in_words 21, 'twenty-one'
            test_in_words 100, 'one hundred'
            test_in_words 101, 'one hundred one'
            test_in_words 110, 'One Hundred Ten', titleize: true
            test_in_words 125, 'One Hundred and Twenty-Five', titleize: true, add_and: true
            test_in_words 1000, 'One Thousand', titleize: true, add_and: true
            test_in_words 1001, 'one thousand and one', add_and: true
            test_in_words 1010, 'one thousand ten'
            test_in_words 1025, 'one thousand twenty-five'
            test_in_words 1100, 'one thousand one hundred'
            test_in_words 1110, 'One Thousand One Hundred and Ten', titleize: true, add_and: true
            test_in_words 1155, 'one thousand one hundred fifty-five'
            test_in_words 10000, 'ten thousand'
            test_in_words 10013, 'ten thousand and thirteen', add_and: true
            test_in_words 10800, 'ten thousand eight hundred'
            test_in_words 10303, 'ten thousand three hundred three'
            test_in_words 99999, 'Ninety-Nine Thousand Nine Hundred and Ninety-Nine', titleize: true, add_and: true
            test_in_words 100000, 'one hundred thousand'
            test_in_words 100002, 'one hundred thousand two'
            test_in_words 101000, 'one hundred and one thousand', add_and: true
            test_in_words 111000, 'one hundred and eleven thousand', add_and: true
            test_in_words 111406, 'one hundred eleven thousand four hundred and six', add_and: true
            test_in_words 1101000, 'one million one hundred and one thousand', add_and: true
            test_in_words 10001000, 'ten million and one thousand', add_and: true
            test_in_words 100201020, 'one hundred million two hundred one thousand and twenty', add_and: true
            test_in_words 678001020, 'six hundred seventy-eight million one thousand and twenty', add_and: true
            test_in_words 2678001020, 'two billion six hundred seventy-eight million one thousand and twenty', add_and: true
            test_in_words 0100, 'sixty-four' # Because of the leading zero, ruby interpreter sees it as an octal number
            test_in_words '0100', 'one hundred' # If there could be a leading zero then you should use number as a string
            test_in_words '00205', 'two hundred and five', add_and: true
        end
    end

    describe '.convert_string_into_chunks_of_max_three_digits' do
        context 'when no arguments given' do
            it 'raises an ArgumentError exception' do
                expect{ NumberInWords.convert_string_into_chunks_of_max_three_digits }.to raise_exception(ArgumentError)
            end
        end

        context 'when valid number of arguments given' do
            it 'requires one mandatory argument' do
                expect(subject).to respond_to(:convert_string_into_chunks_of_max_three_digits).with(1).argument
            end
        end

        context 'when valid type of mandatory argument given' do
            it 'should accept a string type' do
                expect(NumberInWords.convert_string_into_chunks_of_max_three_digits('5')).to eq(['5'])
            end
        end

        context 'when invalid type of mandatory argument given' do
            it 'should return an error for an integer type' do
                expect(NumberInWords.convert_string_into_chunks_of_max_three_digits(5)).to eq("Please provide a number as a String type")
            end

            it 'should return an error for a boolean type' do
                expect(NumberInWords.convert_string_into_chunks_of_max_three_digits(true)).to eq("Please provide a number as a String type")
            end

            it 'should return an error for a float type' do
                expect(NumberInWords.convert_string_into_chunks_of_max_three_digits(5.2)).to eq("Please provide a number as a String type")
            end
        end

        context 'when valid argument given' do
            def self.test_convert_string_into_chunks_of_max_three_digits(input_str, expected_output_array)
                it "converts \"#{input_str}\" into \"#{expected_output_array}\"" do
                    expect(NumberInWords.convert_string_into_chunks_of_max_three_digits(input_str)).to eq(expected_output_array)
                end
            end
            
            test_convert_string_into_chunks_of_max_three_digits '34', ['34']
            test_convert_string_into_chunks_of_max_three_digits '134', ['134']
            test_convert_string_into_chunks_of_max_three_digits '2134', ['2', '134']
            test_convert_string_into_chunks_of_max_three_digits '10134', ['10', '134']
            test_convert_string_into_chunks_of_max_three_digits '100134', ['100', '134']
            test_convert_string_into_chunks_of_max_three_digits '1002134', ['1', '002', '134']
            test_convert_string_into_chunks_of_max_three_digits '12345001', ['12', '345', '001']
        end
    end

    describe '.convert_all_chunks_into_words' do
        context 'when no arguments given' do
            it 'raises an ArgumentError exception' do
                expect{ NumberInWords.convert_all_chunks_into_words }.to raise_exception(ArgumentError)
            end
        end

        context 'when valid number of arguments given' do
            it 'requires one mandatory argument' do
                expect(subject).to respond_to(:convert_all_chunks_into_words).with(1).argument
            end
        end

        context 'when valid type of mandatory argument given' do
            it 'should accept an array type' do
                expect(NumberInWords.convert_all_chunks_into_words(['21'])).to eq('twenty-one')
            end
        end

        context 'when invalid type of mandatory argument given' do
            it 'should return an error for a string type' do
                expect(NumberInWords.convert_all_chunks_into_words('5')).to eq("Please provide an array of chunks of string type")
            end

            it 'should return an error for an integer type' do
                expect(NumberInWords.convert_all_chunks_into_words(5)).to eq("Please provide an array of chunks of string type")
            end

            it 'should return an error for a boolean type' do
                expect(NumberInWords.convert_all_chunks_into_words(true)).to eq("Please provide an array of chunks of string type")
            end

            it 'should return an error for a float type' do
                expect(NumberInWords.convert_all_chunks_into_words(5.2)).to eq("Please provide an array of chunks of string type")
            end
        end

        context 'when valid argument given' do
            def self.test_convert_all_chunks_into_words(input_array, expected_output_str)
                it "converts \"#{input_array}\" into \"#{expected_output_str}\"" do
                    expect(NumberInWords.convert_all_chunks_into_words(input_array)).to eq(expected_output_str)
                end
            end
            
            test_convert_all_chunks_into_words ['34'], 'thirty-four'
            test_convert_all_chunks_into_words ['134'], 'one hundred thirty-four'
            test_convert_all_chunks_into_words ['2', '134'], 'two thousand one hundred thirty-four'
            test_convert_all_chunks_into_words ['10', '134'], 'ten thousand one hundred thirty-four'
            test_convert_all_chunks_into_words ['100', '134'], 'one hundred thousand one hundred thirty-four'
            test_convert_all_chunks_into_words ['1', '002', '134'], 'one million two thousand one hundred thirty-four'
            test_convert_all_chunks_into_words ['12', '345', '001'], 'twelve million three hundred forty-five thousand one'
        end
    end

    describe '.chunk_resolver' do
        context 'when no arguments given' do
            it 'raises an ArgumentError exception' do
                expect{ NumberInWords.chunk_resolver }.to raise_exception(ArgumentError)
            end
        end

        context 'when valid number of arguments given' do
            it 'require two mandatory keyword arguments' do
                expect(subject).to respond_to(:chunk_resolver).with_keywords(:chunk, :first_digit_unit_place_value)
            end
        end

        context 'when valid type of mandatory arguments given' do
            it 'should accept one string and one integer type' do
                expect(NumberInWords.chunk_resolver(chunk: '51', first_digit_unit_place_value: 2)).to eq("fifty-one")
            end
        end

        context 'when invalid type of mandatory argument given' do
            it 'should return an error if both keyword arguments are string type' do
                expect(NumberInWords.chunk_resolver(chunk: '51', first_digit_unit_place_value: '2')).to eq("Please provide a chunk of string type and first_digit_unit_place_value of integer type")
            end

            it 'should return an error if both keyword arguments are integer type' do
                expect(NumberInWords.chunk_resolver(chunk: 51, first_digit_unit_place_value: 2)).to eq("Please provide a chunk of string type and first_digit_unit_place_value of integer type")
            end

            it 'should return an error if both keyword arguments are boolean type' do
                expect(NumberInWords.chunk_resolver(chunk: true, first_digit_unit_place_value: true)).to eq("Please provide a chunk of string type and first_digit_unit_place_value of integer type")
            end

            it 'should return an error if both keyword arguments are float type' do
                expect(NumberInWords.chunk_resolver(chunk: 5.2, first_digit_unit_place_value: 3.5)).to eq("Please provide a chunk of string type and first_digit_unit_place_value of integer type")
            end
        end

        context 'when valid argument given' do
            def self.test_chunk_resolver(input_chunk, input_first_digit_unit_place_value, expected_output_str)
                it "converts a \"#{input_chunk}\" with first digit unit place value \"#{input_first_digit_unit_place_value}\" into \"#{expected_output_str}\"" do
                    expect(NumberInWords.chunk_resolver(chunk: input_chunk, first_digit_unit_place_value: input_first_digit_unit_place_value)).to eq(expected_output_str)
                end
            end
            
            test_chunk_resolver('10', 2, 'ten')
            test_chunk_resolver('42', 2, 'forty-two')
            test_chunk_resolver('000', 3, nil)
            test_chunk_resolver('001', 3, 'one')
            test_chunk_resolver('010', 3, 'ten')
            test_chunk_resolver('011', 3, 'eleven')
            test_chunk_resolver('100', 3, 'one hundred')
            test_chunk_resolver('101', 3, 'one hundred one')
            test_chunk_resolver('110', 3, 'one hundred ten')
            test_chunk_resolver('111', 3, 'one hundred eleven')
            test_chunk_resolver('345', 3, 'three hundred forty-five')
            test_chunk_resolver('1', 4, 'one thousand')
            test_chunk_resolver('10', 5, 'ten thousand')
            test_chunk_resolver('21', 5, 'twenty-one thousand')
            test_chunk_resolver('000', 6, nil)
            test_chunk_resolver('001', 6, 'one thousand')
            test_chunk_resolver('010', 6, 'ten thousand')
            test_chunk_resolver('100', 6, 'one hundred thousand')
            test_chunk_resolver('101', 6, 'one hundred one thousand')
            test_chunk_resolver('111', 6, 'one hundred eleven thousand')
            test_chunk_resolver('121', 6, 'one hundred twenty-one thousand')
        end
    end

    describe '.chunk_and_unit_place_value_corrector' do
        context 'when no arguments given' do
            it 'raises an ArgumentError exception' do
                expect{ NumberInWords.chunk_and_unit_place_value_corrector }.to raise_exception(ArgumentError)
            end
        end

        context 'when valid number of arguments given' do
            it 'require two mandatory keyword arguments' do
                expect(subject).to respond_to(:chunk_and_unit_place_value_corrector).with_keywords(:chunk, :first_digit_unit_place_value)
            end
        end

        context 'when valid type of mandatory arguments given' do
            it 'should accept one string and one integer type' do
                expect(NumberInWords.chunk_and_unit_place_value_corrector(chunk: '51', first_digit_unit_place_value: 2)).to eq({:chunk=>"51", :first_digit_unit_place_value=>2})
            end
        end

        context 'when invalid type of mandatory argument given' do
            it 'should return an error if both keyword arguments are string type' do
                expect(NumberInWords.chunk_and_unit_place_value_corrector(chunk: '51', first_digit_unit_place_value: '2')).to eq("Please provide a chunk of string type and first_digit_unit_place_value of integer type")
            end

            it 'should return an error if both keyword arguments are integer type' do
                expect(NumberInWords.chunk_and_unit_place_value_corrector(chunk: 51, first_digit_unit_place_value: 2)).to eq("Please provide a chunk of string type and first_digit_unit_place_value of integer type")
            end

            it 'should return an error if both keyword arguments are boolean type' do
                expect(NumberInWords.chunk_and_unit_place_value_corrector(chunk: true, first_digit_unit_place_value: true)).to eq("Please provide a chunk of string type and first_digit_unit_place_value of integer type")
            end

            it 'should return an error if both keyword arguments are float type' do
                expect(NumberInWords.chunk_and_unit_place_value_corrector(chunk: 5.2, first_digit_unit_place_value: 3.5)).to eq("Please provide a chunk of string type and first_digit_unit_place_value of integer type")
            end
        end

        context 'when valid argument given' do
            def self.test_chunk_and_unit_place_value_corrector(input_chunk, input_first_digit_unit_place_value, expected_output_hash)
                it "converts a \"#{input_chunk}\" with first digit unit place value \"#{input_first_digit_unit_place_value}\" into \"#{expected_output_hash}\"" do
                    expect(NumberInWords.chunk_and_unit_place_value_corrector(chunk: input_chunk, first_digit_unit_place_value: input_first_digit_unit_place_value)).to eq(expected_output_hash)
                end
            end
            
            test_chunk_and_unit_place_value_corrector('10', 2, {:chunk=>"10", :first_digit_unit_place_value=>2})
            test_chunk_and_unit_place_value_corrector('42', 2, {:chunk=>"42", :first_digit_unit_place_value=>2})
            test_chunk_and_unit_place_value_corrector('000', 3, nil)
            test_chunk_and_unit_place_value_corrector('001', 3, {:chunk=>"1", :first_digit_unit_place_value=>1})
            test_chunk_and_unit_place_value_corrector('010', 3, {:chunk=>"10", :first_digit_unit_place_value=>2})
            test_chunk_and_unit_place_value_corrector('011', 3, {:chunk=>"11", :first_digit_unit_place_value=>2})
            test_chunk_and_unit_place_value_corrector('100', 3, {:chunk=>"100", :first_digit_unit_place_value=>3})
            test_chunk_and_unit_place_value_corrector('101', 3, {:chunk=>"101", :first_digit_unit_place_value=>3})
            test_chunk_and_unit_place_value_corrector('110', 3, {:chunk=>"110", :first_digit_unit_place_value=>3})
            test_chunk_and_unit_place_value_corrector('111', 3, {:chunk=>"111", :first_digit_unit_place_value=>3})
            test_chunk_and_unit_place_value_corrector('345', 3, {:chunk=>"345", :first_digit_unit_place_value=>3})
            test_chunk_and_unit_place_value_corrector('1', 4, {:chunk=>"1", :first_digit_unit_place_value=>4})
            test_chunk_and_unit_place_value_corrector('10', 5, {:chunk=>"10", :first_digit_unit_place_value=>5})
            test_chunk_and_unit_place_value_corrector('21', 5, {:chunk=>"21", :first_digit_unit_place_value=>5})
            test_chunk_and_unit_place_value_corrector('000', 6, nil)
            test_chunk_and_unit_place_value_corrector('001', 6, {:chunk=>"1", :first_digit_unit_place_value=>4})
            test_chunk_and_unit_place_value_corrector('010', 6, {:chunk=>"10", :first_digit_unit_place_value=>5})
            test_chunk_and_unit_place_value_corrector('100', 6, {:chunk=>"100", :first_digit_unit_place_value=>6})
            test_chunk_and_unit_place_value_corrector('101', 6, {:chunk=>"101", :first_digit_unit_place_value=>6})
            test_chunk_and_unit_place_value_corrector('111', 6, {:chunk=>"111", :first_digit_unit_place_value=>6})
            test_chunk_and_unit_place_value_corrector('121', 6, {:chunk=>"121", :first_digit_unit_place_value=>6})
        end
    end

    describe '.unit_resolver' do
        context 'when no arguments given' do
            it 'raises an ArgumentError exception' do
                expect{ NumberInWords.unit_resolver }.to raise_exception(ArgumentError)
            end
        end

        context 'when valid number of arguments given' do
            it 'require one mandatory keyword argument and an options hash' do
                expect(subject).to respond_to(:unit_resolver).with_keywords(:digit_str).and_any_keywords
            end
        end

        context 'when valid type of mandatory argument given' do
            it 'should accept one keyword argument of string type' do
                expect(NumberInWords.unit_resolver(digit_str: '5')).to eq('five')
            end

            it 'should accept one keyword argument of string type and an optional unit keyword' do
                expect(NumberInWords.unit_resolver(digit_str: '5', unit: 'hundred')).to eq('five hundred')
            end
        end

        context 'when invalid type of mandatory argument given' do
            it 'should return an error for integer type' do
                expect(NumberInWords.unit_resolver(digit_str: 5)).to eq("Please provide a single digit number of string type")
            end

            it 'should return an error for boolean type' do
                expect(NumberInWords.unit_resolver(digit_str: true)).to eq("Please provide a single digit number of string type")
            end

            it 'should return an error for float type' do
                expect(NumberInWords.unit_resolver(digit_str: 5.2)).to eq("Please provide a single digit number of string type")
            end
        end

        context 'when valid argument given' do
            def self.test_unit_resolver(input_digit_str, input_unit, expected_output_str)
                it "converts a \"#{input_digit_str}\" with unit \"#{input_unit}\" into \"#{expected_output_str}\"" do
                    if input_unit.empty?
                        expect(NumberInWords.unit_resolver(digit_str: input_digit_str)).to eq(expected_output_str)
                    else
                        expect(NumberInWords.unit_resolver(digit_str: input_digit_str, unit: input_unit)).to eq(expected_output_str)
                    end
                end
            end

            test_unit_resolver('0', '', 'zero')
            test_unit_resolver('5', '', 'five')
            test_unit_resolver('2', 'hundred', 'two hundred')
        end
    end

    describe '.ten_resolver' do
        context 'when no arguments given' do
            it 'raises an ArgumentError exception' do
                expect{ NumberInWords.ten_resolver }.to raise_exception(ArgumentError)
            end
        end

        context 'when valid number of arguments given' do
            it 'require one mandatory keyword argument and an options hash' do
                expect(subject).to respond_to(:ten_resolver).with_keywords(:number_str).and_any_keywords
            end
        end

        context 'when valid type of mandatory argument given' do
            it 'should accept one keyword argument of string type' do
                expect(NumberInWords.ten_resolver(number_str: '50')).to eq('fifty')
            end

            it 'should accept one keyword argument of string type and an optional unit keyword' do
                expect(NumberInWords.ten_resolver(number_str: '50', unit: 'thousand')).to eq('fifty thousand')
            end
        end

        context 'when invalid type of mandatory argument given' do
            it 'should return an error for integer type' do
                expect(NumberInWords.ten_resolver(number_str: 5)).to eq("Please provide a two digits number of string type")
            end

            it 'should return an error for boolean type' do
                expect(NumberInWords.ten_resolver(number_str: true)).to eq("Please provide a two digits number of string type")
            end

            it 'should return an error for float type' do
                expect(NumberInWords.ten_resolver(number_str: 5.2)).to eq("Please provide a two digits number of string type")
            end
        end

        context 'when valid argument given' do
            def self.test_ten_resolver(input_number_str, input_unit, expected_output_str)
                it "converts a \"#{input_number_str}\" with unit \"#{input_unit}\" into \"#{expected_output_str}\"" do
                    if input_unit.empty?
                        expect(NumberInWords.ten_resolver(number_str: input_number_str)).to eq(expected_output_str)
                    else
                        expect(NumberInWords.ten_resolver(number_str: input_number_str, unit: input_unit)).to eq(expected_output_str)
                    end
                end
            end

            test_ten_resolver('00', '', nil)
            test_ten_resolver('00', 'thousand', 'thousand')
            test_ten_resolver('01', '', 'one')
            test_ten_resolver('5', '', 'five')
            test_ten_resolver('10', '', 'ten')
            test_ten_resolver('11', '', 'eleven')
            test_ten_resolver('21', '', 'twenty-one')
            test_ten_resolver('50', 'thousand', 'fifty thousand')
        end
    end

    describe '.hundred_resolver' do
        context 'when no arguments given' do
            it 'raises an ArgumentError exception' do
                expect{ NumberInWords.hundred_resolver }.to raise_exception(ArgumentError)
            end
        end

        context 'when valid number of arguments given' do
            it 'require two mandatory keyword arguments' do
                expect(subject).to respond_to(:hundred_resolver).with_keywords(:number_str, :units_array)
            end
        end

        context 'when valid type of mandatory arguments given' do
            it 'should accept one string and one array type' do
                expect(NumberInWords.hundred_resolver(number_str: '501', units_array: ['hundred'])).to eq('five hundred one')
            end
        end

        context 'when invalid type of mandatory arguments given' do
            it 'should return an error if both keyword arguments are string type' do
                expect(NumberInWords.hundred_resolver(number_str: '501', units_array: 'hundred')).to eq("Please provide a number of string type and an array of units")
            end

            it 'should return an error if both keyword arguments are integer type' do
                expect(NumberInWords.hundred_resolver(number_str: 501, units_array: 2)).to eq("Please provide a number of string type and an array of units")
            end

            it 'should return an error if both keyword arguments are boolean type' do
                expect(NumberInWords.hundred_resolver(number_str: true, units_array: true)).to eq("Please provide a number of string type and an array of units")
            end

            it 'should return an error if both keyword arguments are float type' do
                expect(NumberInWords.hundred_resolver(number_str: 5.2, units_array: 3.5)).to eq("Please provide a number of string type and an array of units")
            end
        end

        context 'when valid argument given' do
            def self.test_hundred_resolver(input_number_str, input_units_array, expected_output_str)
                it "converts a \"#{input_number_str}\" with given units \"#{input_units_array}\" into \"#{expected_output_str}\"" do
                    expect(NumberInWords.hundred_resolver(number_str: input_number_str, units_array: input_units_array)).to eq(expected_output_str)
                end
            end

            test_hundred_resolver('1', ['hundred'], 'one hundred')
            test_hundred_resolver('100', ['hundred'], 'one hundred')
            test_hundred_resolver('101', ['hundred'], 'one hundred one')
            test_hundred_resolver('110', ['hundred'], 'one hundred ten')
            test_hundred_resolver('119', ['hundred'], 'one hundred nineteen')
            test_hundred_resolver('121', ['hundred'], 'one hundred twenty-one')
            test_hundred_resolver('100', ['hundred', 'thousand'], 'one hundred thousand')
            test_hundred_resolver('101', ['hundred', 'thousand'], 'one hundred one thousand')
            test_hundred_resolver('121', ['hundred', 'thousand'], 'one hundred twenty-one thousand')
        end
    end

    describe '.titleize' do
        it 'capitalizes the first letter of every word' do
            expect(NumberInWords.titleize('one hundred twenty-one')).to eq('One Hundred Twenty-One')
        end
    end

    describe '.add_and' do
        def self.test_add_and(input_str, expected_output_str)
            it "adds an \"and\" in the number-to-words string at the right place" do
                expect(NumberInWords.add_and(input_str)).to eq(expected_output_str)
            end
        end

        test_add_and('one hundred one', 'one hundred and one')
        test_add_and('one hundred twenty-one', 'one hundred and twenty-one')
        test_add_and('one million one hundred ten', 'one million one hundred and ten')
        test_add_and('one hundred fifty thousand two hundred one', 'one hundred fifty thousand two hundred and one')
        test_add_and('one hundred thousand', 'one hundred thousand')
        test_add_and('one million one hundred', 'one million and one hundred')
        test_add_and('two hundred ten thousand', 'two hundred and ten thousand')
        test_add_and('one hundred fifty-one thousand', 'one hundred and fifty-one thousand')
        test_add_and('one hundred fifty thousand two hundred', 'one hundred fifty thousand and two hundred')
        test_add_and('one million two hundred thousand', 'one million and two hundred thousand')
    end

    describe '.last_word_exists_in_dictionary?' do
        context 'when last word exists' do
            specify { expect(NumberInWords.last_word_exists_in_dictionary?(["one", "hundred", "ten"])).to be true }
            specify { expect(NumberInWords.last_word_exists_in_dictionary?(["one", "hundred", "twenty-one"])).to be true }
        end

        context 'when last word does not exist' do
            specify { expect(NumberInWords.last_word_exists_in_dictionary?(["one", "hundred", "thousand"])).to be false }
            specify { expect(NumberInWords.last_word_exists_in_dictionary?(["one", "hundred", "ten", "thousand"])).to be false }
        end
    end

    describe '.second_last_word_exists_in_dictionary?' do
        context 'when second last word exists' do
            specify { expect(NumberInWords.second_last_word_exists_in_dictionary?(["one", "hundred", "ten", "thousand"])).to be true }
            specify { expect(NumberInWords.second_last_word_exists_in_dictionary?(["one", "hundred", "twenty-five", "thousand"])).to be true }
            specify { expect(NumberInWords.second_last_word_exists_in_dictionary?(["one", "million", "one", "hundred", "ten", "thousand"])).to be true }
        end
        
        context 'when second last word does not exist' do
            specify { expect(NumberInWords.second_last_word_exists_in_dictionary?(["one", "million", "one", "hundred", "thousand"])).to be false }
        end
    end
    
    describe '.third_last_word_exists_in_dictionary?' do
        context 'when third last word exists' do
            specify { expect(NumberInWords.third_last_word_exists_in_dictionary?(["one", "million", "one", "hundred", "thousand"])).to be true }
        end
        
        context 'when third last word does not exist' do
            specify { expect(NumberInWords.third_last_word_exists_in_dictionary?(["one", "hundred", "ten", "thousand"])).to be false }
            specify { expect(NumberInWords.third_last_word_exists_in_dictionary?(["one", "hundred", "twenty-five", "thousand"])).to be false }
            specify { expect(NumberInWords.third_last_word_exists_in_dictionary?(["one", "million", "one", "hundred", "ten", "thousand"])).to be false }
        end
    end
    
    describe '.value_exists_in_dictionary?' do
        context 'when value exists' do
            specify { expect(NumberInWords.value_exists_in_dictionary?("one")).to be true }
            specify { expect(NumberInWords.value_exists_in_dictionary?("ten")).to be true }
            specify { expect(NumberInWords.value_exists_in_dictionary?("twenty-one")).to be true }
        end
        
        context 'when value does not exist' do
            specify { expect(NumberInWords.value_exists_in_dictionary?("hundred")).to be false }
            specify { expect(NumberInWords.value_exists_in_dictionary?("million")).to be false }
        end
    end
end
