require 'minitest/autorun'
require './lib/vending_machine'

class VendingMachineTest < Minitest::Test
  def test_step_0_お金の投入と払い戻し
    # 以下の2行は動作確認用のコードなので削除して良い
    machine = VendingMachine.new
    assert !machine.nil?

    # 以下の要求仕様（テストケース）は必要に応じてテストメソッド（def test_xxx）を分けても良い
    #
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    # 投入は複数回できる。
    # 投入金額の総計を取得できる。
    # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  end

  # 以下、step1以降の要求仕様も同様にTDDで自動販売機プログラムを書いていく
end
