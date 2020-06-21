require 'minitest/autorun'
require './lib/suica'

class SuicaTest < Minitest::Test
  def test_step_0
    # Suicaには100円以上の任意の金額をチャージできる
    # Suicaは現在のチャージ残高を取得できる。
    suica = Suica.new(500)
    assert_equal 500, suica.balance
    assert_equal 1500, suica.charge_money(1000)
    assert_nil suica.charge_money(99)
    assert_equal 1500, suica.balance
    assert_equal 1600, suica.charge_money(100)
    assert_equal 1600, suica.balance
  end
end
