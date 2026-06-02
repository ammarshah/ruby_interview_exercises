require 'minitest/autorun'
require_relative 'split_on_delimiter'

class TestSplitOnDelimiter < Minitest::Test
  def test_dot_delimiter_example
    assert_equal(["this", "is", "a", "delimitted", "string"], split_on_delimiter("....this...is.a.delimitted.string...", "."))
  end

  def test_space_delimiter
    assert_equal(["hello", "world"], split_on_delimiter("hello world", " "))
  end

  def test_leading_delimiters_ignored
    assert_equal(["a", "b"], split_on_delimiter("...a.b", "."))
  end

  def test_trailing_delimiters_ignored
    assert_equal(["a", "b"], split_on_delimiter("a.b...", "."))
  end

  def test_multiple_consecutive_delimiters_between
    assert_equal(["a", "b"], split_on_delimiter("a..b", "."))
  end

  def test_empty_string_returns_empty
    assert_equal([], split_on_delimiter("", "."))
  end

  def test_only_delimiters_returns_empty
    assert_equal([], split_on_delimiter("....", "."))
  end

  def test_no_delimiter_present_returns_whole_string
    assert_equal(["abc"], split_on_delimiter("abc", "."))
  end

  def test_spaces_multiple
    assert_equal(["hello", "world"], split_on_delimiter("  hello   world ", " "))
  end

  def test_empty_delimiter_behaves_like_no_delimiter
    assert_equal(["abc"], split_on_delimiter("abc", ""))
  end

  def test_unicode_delimiter
    assert_equal(["a", "b"], split_on_delimiter("a—b", "—"))
  end

  def test_multi_character_delimiter_1
    assert_equal(["a", "b"], split_on_delimiter("a--b", "--"))
  end

  def test_multi_character_delimiter_2
    assert_equal(["a", "b", "-c", "d"], split_on_delimiter("a--b---c----d", "--"))
  end
end
