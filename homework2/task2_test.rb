require "./task2"
require "test/unit"

class TestTask2 < Test::Unit::TestCase
  def test_simple
    c = CartesianProduct.new([:a,:b], [4,5])
    c.each { |elt| puts elt.inspect }
    # [:a, 4]
    # [:a, 5]
    # [:b, 4]
    # [:b, 5]
    c = CartesianProduct.new([:a,:b], [])
    c.each { |elt| puts elt.inspect }
    # (nothing printed since Cartesian product
    # of anything with an empty collection is empty)
    # 
    # assert_equal(1.292, 1.euro)
    # assert_equal(25.84, 20.euros)
    # assert_equal(13, 1000.yen)
    # assert_equal(57, 3000.rupees)
    # assert_equal(3.869969040247678, 5.dollars.in(:euros))
    # assert_equal(680, 10.euros.in(:rupees))
    # assert_equal(52.631578947368425, 1.dollar.in(:rupees))
    # assert_equal(0.14705882352941177, 10.rupees.in(:euro))
    # assert_equal(52.631578947368425, 1.dollar.in('rupees'))
    # assert_equal(false, "foo".palindrome?)
    # assert_equal(true, "abba".palindrome?)
    # assert_equal(true, [1,2,3,2,1].palindrome?)
    # assert_equal(false, [1 => 1, 2 => 1, 3 => 1, 2 => 1, 1 => 1].palindrome?)
  end
end

