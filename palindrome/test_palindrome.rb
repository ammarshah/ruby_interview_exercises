require 'minitest/autorun'
require_relative 'palindrome'

class TestPalindrome < Minitest::Test
  def test_empty_string_is_palindrome
    assert_equal(true, is_palindrome?(''))
  end

  def test_single_character_is_palindrome
    assert_equal(true, is_palindrome?('a'))
  end

  def test_simple_palindrome_word
    assert_equal(true, is_palindrome?('madam'))
  end

  def test_palindrome_with_mixed_case
    assert_equal(true, is_palindrome?('RaceCar'))
  end

  def test_palindrome_with_spaces_and_punctuation
    assert_equal(true, is_palindrome?("Madam, I'm Adam!"))
  end

  def test_numeric_palindrome
    assert_equal(true, is_palindrome?('12321'))
  end

  def test_non_palindrome_word
    assert_equal(false, is_palindrome?('hello'))
  end

  def test_non_palindrome_with_punctuation
    assert_equal(false, is_palindrome?('Hello, World!'))
  end
end
