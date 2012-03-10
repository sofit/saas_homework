require "./task2"
require "test/unit"

class TestTask2 < Test::Unit::TestCase
  def test_simple
    c = CartesianProduct.new([:a,:b], [4,5])
    assert_equal([[:a, 4], [:a, 5], [:b, 4], [:b, 5]], c.each() {})
    c.each { |elt| puts elt.inspect }
    c = CartesianProduct.new([:a,:b], [])
    assert_equal([], c.each() {})
    c.each_with_index { |elt| puts elt.inspect }
  end
end

