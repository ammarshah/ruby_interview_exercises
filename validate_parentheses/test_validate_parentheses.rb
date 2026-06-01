require 'minitest/autorun'
require_relative 'validate_parentheses'

class TestValidateParentheses < Minitest::Test
  def test_empty_string
    assert_equal("VALID PARENTHESES", validate_parentheses(""))
  end

  def test_single_pair_of_parentheses
    assert_equal("VALID PARENTHESES", validate_parentheses("()"))
  end

  def test_multiple_pairs_of_parentheses
    assert_equal("VALID PARENTHESES", validate_parentheses("(())"))
  end

  def test_nested_parentheses
    assert_equal("VALID PARENTHESES", validate_parentheses("((()))"))
  end

  def test_alternating_parentheses
    assert_equal("VALID PARENTHESES", validate_parentheses("()()()()"))
  end

  def test_complex_valid_sequence_1
    assert_equal("VALID PARENTHESES", validate_parentheses("(())()()"))
  end

  def test_complex_valid_sequence_2
    assert_equal("VALID PARENTHESES", validate_parentheses("(((()))(()))"))
  end

  def test_deeply_nested_valid_parentheses
    assert_equal("VALID PARENTHESES", validate_parentheses("((((()))))"))
  end

  def test_missing_opening_at_start
    assert_equal("INVALID PARENTHESES: Missing opening parenthesis", validate_parentheses(")()()"))
  end

  def test_missing_opening_in_middle
    assert_equal("INVALID PARENTHESES: Missing opening parenthesis", validate_parentheses("()(()))()"))
  end

  def test_missing_opening_multiple
    assert_equal("INVALID PARENTHESES: Missing opening parenthesis", validate_parentheses(")))"))
  end

  def test_invalid_parentheses
    assert_equal("INVALID PARENTHESES: Missing opening parenthesis", validate_parentheses("))(("))
  end

  def test_missing_closing_single
    assert_equal("INVALID PARENTHESES: Missing closing parenthesis", validate_parentheses("("))
  end

  def test_missing_closing_multiple
    assert_equal("INVALID PARENTHESES: Missing closing parenthesis", validate_parentheses("((("))
  end

  def test_missing_closing_at_end
    assert_equal("INVALID PARENTHESES: Missing closing parenthesis", validate_parentheses("()()("))
  end

  def test_missing_closing_complex
    assert_equal("INVALID PARENTHESES: Missing closing parenthesis", validate_parentheses("((())"))
  end

  def test_invalid_parentheses_2
    assert_equal("INVALID PARENTHESES: Missing closing parenthesis", validate_parentheses("()(()"))
  end
end
