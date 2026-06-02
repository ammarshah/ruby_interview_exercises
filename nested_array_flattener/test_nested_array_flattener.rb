require 'minitest/autorun'
require_relative 'nested_array_flattener'

class TestNestedArrayFlattener < Minitest::Test
  def test_empty_array
    assert_equal([], nested_array_flattener([]))
  end

  def test_flat_array
    assert_equal([1, 2, 3, 4], nested_array_flattener([1, 2, 3, 4]))
  end

  def test_single_nested_array
    assert_equal([1, 2, 3, 4], nested_array_flattener([1, [2, 3], 4]))
  end

  def test_deeply_nested_array
    nested = [1, [2, [3, [4, [5]]]], 6]
    assert_equal([1, 2, 3, 4, 5, 6], nested_array_flattener(nested))
  end

  def test_multiple_nested_groups
    nested = [1, [2, 3, [4, 5, [6, 7]]], 8, [9, 10]]
    assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], nested_array_flattener(nested))
  end

  def test_nested_empty_arrays
    nested = [1, [], [2, [[], [3]]], []]
    assert_equal([1, 2, 3], nested_array_flattener(nested))
  end

  def test_non_numeric_elements
    nested = ['a', ['b', ['c']], 'd']
    assert_equal(['a', 'b', 'c', 'd'], nested_array_flattener(nested))
  end
end
