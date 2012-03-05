require "./task5"
require "test/unit"

class TestTask5 < Test::Unit::TestCase
  def test_simple
    f = Foo.new
    f.bar = 1
    f.bar = 2
    assert_equal([nil,1,2], f.bar_history)
    f = Foo.new
    f.bar = 4
    assert_equal([nil,4], f.bar_history)
  end

  def test_failure
    # assert_raise( NoMethodError ) { combine_anagrams(nil) }
    # assert_raise( ArgumentError ) { combine_anagrams() }
  end

end

