require "./task1"
require "test/unit"

class TestTask1a < Test::Unit::TestCase
  def test_simple
    assert_equal(true, palindrome?("A man, a plan, a canal -- Panama"))
    assert_equal(true, palindrome?("Madam, I'm Adam!"))
    assert_equal(false, palindrome?("Abracadabra"))
    assert_equal(true, palindrome?(""))
    assert_equal(true, palindrome?(''))
    assert_equal({'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1},
      count_words("A man, a plan, a canal -- Panama"))
    assert_equal({'doo' => 3, 'bee' => 2}, count_words("Doo bee doo bee doo"))
  end

  def test_failure
    assert_raise( NoMethodError ) { palindrome?(nil) }
    assert_raise( ArgumentError ) { palindrome?() }
    assert_raise( NoMethodError ) { count_words(nil) }
    assert_raise( ArgumentError ) { count_words() }
  end

end

