require 'minitest/autorun'
require_relative 'fibonacci'

class TestFibonacci < Minitest::Test
  def test_zero_terms
    assert_equal([], fibonacci(0))
  end

  def test_one_term
    assert_equal([0], fibonacci(1))
  end

  def test_two_terms
    assert_equal([0, 1], fibonacci(2))
  end

  def test_three_terms
    assert_equal([0, 1, 1], fibonacci(3))
  end

  def test_five_terms
    assert_equal([0, 1, 1, 2, 3], fibonacci(5))
  end

  def test_ten_terms
    assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34], fibonacci(10))
  end

  def test_larger_sequence
    expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    assert_equal(expected, fibonacci(12))
  end
end
