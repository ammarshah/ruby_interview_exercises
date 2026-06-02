require 'minitest/autorun'
require_relative 'remove_duplicate_characters'

class TestRemoveDuplicateCharacters < Minitest::Test
  def test_empty_string_returns_empty
    assert_equal('', remove_duplicate_characters(''))
  end

  def test_string_with_no_duplicates_returns_same_string
    assert_equal('abcdef', remove_duplicate_characters('abcdef'))
  end

  def test_string_with_consecutive_duplicates
    assert_equal('helo', remove_duplicate_characters('hello'))
  end

  def test_string_with_repeated_duplicates
    assert_equal('abc', remove_duplicate_characters('aabbcc'))
  end

  def test_string_with_non_consecutive_duplicates
    assert_equal('helo wrd', remove_duplicate_characters('hello world'))
  end

  def test_string_with_mixed_characters
    assert_equal('abcABC123! ', remove_duplicate_characters('aabbccAABBCC112233!!  '))
  end

  def test_string_with_all_same_characters
    assert_equal('x', remove_duplicate_characters('xxxxxxxx'))
  end
end
