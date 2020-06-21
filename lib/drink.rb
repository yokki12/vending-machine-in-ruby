class Drink
  attr_accessor :name, :price

  def self.cola
    self.new('cola', 120)
  end

  def initialize(name, price)
    @name = name
    @price = price
  end
end