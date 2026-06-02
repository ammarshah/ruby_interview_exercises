require 'minitest/autorun'
require_relative 'pangram'

class TestPangram < Minitest::Test
  def test_empty_string_is_not_pangram
    assert_equal(false, is_pangram?(''))
  end

  def test_simple_non_pangram
    assert_equal(false, is_pangram?('abcdefghijklmnopqrstuvwxyz'.delete('q')))
  end

  def test_valid_pangram_sentence
    assert_equal(true, is_pangram?('The quick brown fox jumps over the lazy dog'))
  end

  def test_pangram_with_punctuation_and_uppercase
    assert_equal(true, is_pangram?('Pack my box with five dozen liquor jugs.'))
  end

  def test_non_pangram_missing_letters
    assert_equal(false, is_pangram?('Hello world'))
  end

  def test_pangram_with_repeated_letters
    assert_equal(true, is_pangram?('Sphinx of black quartz, judge my vow'))
  end
end
