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
