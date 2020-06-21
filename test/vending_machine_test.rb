require 'minitest/autorun'
require './lib/vending_machine'
require './lib/suica'

class VendingMachineTest < Minitest::Test
  def test_step_1
    # 自動販売機は値段と名前の属性からなるジュースを１種類格納できる。初期状態で、コーラ（値段:120円、名前”コーラ”）を5本格納している。
    # 自動販売機は格納されているジュースの情報（値段と名前と在庫）を取得できる。
    machine = VendingMachine.new
    expected = [
      {
        name: 'コーラ',
        price: 120,
        stock: 5,
      }
    ]
    assert_equal expected, machine.current_stocks
  end
  
  def test_step_2
    # 自動販売機は在庫の点で、コーラが購入できるかどうかを取得できる。
    machine = VendingMachine.new
    assert machine.stock_available?('コーラ')
    # ジュース値段以上のチャージ残高がある条件下で購入操作を行うと、自動販売機はジュースの在庫を減らし、売り上げ金額を増やし、Suicaのチャージ残高を減らす。
    suica = Suica.new(120)
    drink = machine.buy('コーラ', suica)
    assert_equal 'コーラ', drink.name
    expected = [
      {
        name: 'コーラ',
        price: 120,
        stock: 4,
      }
    ]
    assert_equal expected, machine.current_stocks
    assert_equal 120, machine.sales_amount
    assert_equal 0, suica.balance
  end

  def test_step2_チャージ残高が足りない場合
    # チャージ残高が足りない場合、購入操作を行っても何もしない。
    # 自動販売機は現在の売上金額を取得できる。
    machine = VendingMachine.new
      assert machine.stock_available?('コーラ')
      suica = Suica.new(119)
      drink = machine.buy('コーラ', suica)
      assert_nil drink
      expected = [
        {
          name: 'コーラ',
          price: 120,
          stock: 5,
        }
      ]
      assert_equal expected, machine.current_stocks
      assert_equal 0, machine.sales_amount
      assert_equal 119, suica.balance
  end

  def test_step2_在庫が足りない場合
    # 在庫がない場合、購入操作を行っても何もしない。
    # 自動販売機は現在の売上金額を取得できる。  
    machine = VendingMachine.new
    assert machine.stock_available?('コーラ')
    suica = Suica.new(10000)
    machine.buy('コーラ', suica)
    machine.buy('コーラ', suica)
    machine.buy('コーラ', suica)
    machine.buy('コーラ', suica)
    assert machine.stock_available?('コーラ')
    machine.buy('コーラ', suica)
    refute machine.stock_available?('コーラ')
    assert_nil machine.buy('コーラ', suica)
    assert_equal 9400, suica.balance
    assert_equal 600, machine.sales_amount
    assert_equal [], machine.current_stocks
  end
end

 