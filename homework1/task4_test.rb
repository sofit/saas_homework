require "./task4"
require "test/unit"

class TestTask4 < Test::Unit::TestCase
  def test_simple
    assert_equal(true, Dessert.new('Dessert1', 100).healthy?)
    assert_equal(false, Dessert.new('Dessert2', 200).healthy?)
    assert_equal(true, Dessert.new('Dessert3', 200).delicious?)
    assert_equal(true, JellyBean.new('Dessert4', 100, 'flavor1').healthy?)
    assert_equal(false, JellyBean.new('Dessert5', 200, 'flavor2').healthy?)
    assert_equal(true, JellyBean.new('Dessert6', 200, 'flavor3').delicious?)
    assert_equal(false, JellyBean.new('Dessert6', 200, 'black licorice').delicious?)
  end

  def test_failure
    # assert_raise( NoMethodError ) { combine_anagrams(nil) }
    # assert_raise( ArgumentError ) { combine_anagrams() }
  end

end

