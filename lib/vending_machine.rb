require './lib/drink'

class VendingMachine

  def initialize
    @stocks = []
    5.times do
      @stocks << Drink.cola
    end
  end

  def current_stocks
    drink = @stocks[0]
    [{name: drink.name, price: drink.price, stock: @stocks.count}]
  end
end

# step1
# 自動販売機は値段と名前の属性からなるジュースを１種類格納できる。
# 初期状態で、コーラ（値段:120円、名前”コーラ”）を5本格納している。
# 自動販売機は格納されているジュースの情報（値段と名前と在庫）を取得できる。