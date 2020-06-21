require 'minitest/autorun'
require './lib/vending_machine'
require './lib/suica'

class VendingMachineTest < Minitest::Test
  def test_step_1
    machine = VendingMachine.new
    expected = [
      {
        name: 'cola',
        price: 120,
        stock: 5,
      }
    ]
    assert_equal expected, machine.current_stocks
  end
end

