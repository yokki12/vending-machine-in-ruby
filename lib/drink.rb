class Drink
  attr_accessor :name, :price

  def self.coke
    self.new('コーラ', 120)
  end

  def initialize(name, price)
    @name = name
    @price = price
  end
end