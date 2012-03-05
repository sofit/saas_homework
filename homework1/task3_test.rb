require "./task3"
require "test/unit"

class TestTask3 < Test::Unit::TestCase
  def test_simple
    assert_equal([["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]], 
      combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']))
  end

  def test_failure
    assert_raise( NoMethodError ) { combine_anagrams(nil) }
    assert_raise( ArgumentError ) { combine_anagrams() }
  end

end

