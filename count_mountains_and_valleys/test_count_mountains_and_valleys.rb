require 'minitest/autorun'
require_relative 'count_mountains_and_valleys'

class TestCountMountainsAndValleys < Minitest::Test
  def test_empty_array
    result = count_mountains_and_valleys([])
    assert_equal 0, result[:mountains]
    assert_equal 0, result[:valleys]
  end

  def test_single_mountain
    result = count_mountains_and_valleys(['U', 'D'])
    assert_equal 1, result[:mountains]
    assert_equal 0, result[:valleys]
  end

  def test_single_valley
    result = count_mountains_and_valleys(['D', 'U'])
    assert_equal 0, result[:mountains]
    assert_equal 1, result[:valleys]
  end

  def test_multiple_mountains
    result = count_mountains_and_valleys(['U', 'D', 'U', 'D'])
    assert_equal 2, result[:mountains]
    assert_equal 0, result[:valleys]
  end

  def test_multiple_valleys
    result = count_mountains_and_valleys(['D', 'U', 'D', 'U'])
    assert_equal 0, result[:mountains]
    assert_equal 2, result[:valleys]
  end

  def test_mixed_mountains_and_valleys
    result = count_mountains_and_valleys(['U', 'D', 'D', 'U'])
    assert_equal 1, result[:mountains]
    assert_equal 1, result[:valleys]
  end

  def test_no_mountains_or_valleys
    result = count_mountains_and_valleys(['U', 'U', 'D', 'U'])
    assert_equal 0, result[:mountains]
    assert_equal 0, result[:valleys]
  end

  def test_deep_mountain
    result = count_mountains_and_valleys(['U', 'U', 'U', 'D', 'D', 'D'])
    assert_equal 1, result[:mountains]
    assert_equal 0, result[:valleys]
  end

  def test_deep_valley
    result = count_mountains_and_valleys(['D', 'D', 'D', 'U', 'U', 'U'])
    assert_equal 0, result[:mountains]
    assert_equal 1, result[:valleys]
  end

  def test_alternating_ups_and_downs
    result = count_mountains_and_valleys(['U', 'D', 'U', 'D', 'U', 'D'])
    assert_equal 3, result[:mountains]
    assert_equal 0, result[:valleys]
  end

  def test_alternating_downs_and_ups
    result = count_mountains_and_valleys(['D', 'U', 'D', 'U', 'D', 'U'])
    assert_equal 0, result[:mountains]
    assert_equal 3, result[:valleys]
  end

  def test_complex_path_1
    result = count_mountains_and_valleys(['U', 'U', 'D', 'U', 'D', 'D', 'D', 'U', 'U', 'D'])
    assert_equal 2, result[:mountains]
    assert_equal 1, result[:valleys]
  end

  def test_complex_path_2
    result = count_mountains_and_valleys(['U', 'U', 'U', 'D', 'D', 'D', 'D', 'U', 'D', 'D', 'U', 'U', 'U', 'U', 'D', 'D'])
    assert_equal 2, result[:mountains]
    assert_equal 2, result[:valleys]
  end
end
