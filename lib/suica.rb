class Suica
  attr_accessor :balance

  def initialize(money)
    @balance = money
  end

  def charge_money(money)
    return if money < 100
    @balance += money
  end

  def withdraw_money(money)
    @balance -= money
  end
end

# step0
# Suicaには100円以上の任意の金額をチャージできる
# Suicaは現在のチャージ残高を取得できる。
