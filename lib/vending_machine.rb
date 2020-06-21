require './lib/drink'

class VendingMachine

  def initialize
    @stocks = {}
    5.times do
      drink = Drink.cola
      unless @stocks[drink.name]
        @stocks[drink.name] = []
      end
      @stocks[drink.name] << drink
    end
  end

  def current_stocks
    @stocks.map do |name, drinks|
      drink = drinks.first
      {name: drink.name, price: drink.price, stock: drinks.count}
    end
  end
end
