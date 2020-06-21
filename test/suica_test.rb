require 'minitest/autorun'
require './lib/suica'

class SuicaTest < Minitest::Test
  def test_step_0
    suica = Suica.new(500)
    assert_equal 500, suica.balance
    assert_equal 1500, suica.charge_money(1000)
    assert_nil suica.charge_money(99)
    assert_equal 1500, suica.balance
    assert_equal 1600, suica.charge_money(100)
    assert_equal 1600, suica.balance
  end
end
