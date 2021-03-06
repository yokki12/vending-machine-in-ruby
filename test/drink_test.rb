require 'minitest/autorun'
require './lib/drink'

class DrinkTest < Minitest::Test
  def test_coke
    # 自動販売機は値段と名前の属性からなるジュースを１種類格納できる。初期状態で、コーラ（値段:120円、名前”コーラ”）を5本格納している。
    # 自動販売機は格納されているジュースの情報（値段と名前と在庫）を取得できる。
    drink = Drink.coke
    assert_equal 'コーラ', drink.name
    assert_equal 120, drink.price
  end
end
