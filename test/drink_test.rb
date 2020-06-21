require 'minitest/autorun'
require './lib/drink'

class DrinkTest < Minitest::Test
  def test_cola
    drink = Drink.cola
    assert_equal 'cola', drink.name
    assert_equal 120, drink.price
  end
end
