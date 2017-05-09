require('minitest/autorun')
require('minitest/rg')
require_relative('../item')

class TestItem < MiniTest::Test

  def setup
    @bread = Item.new("bread", 1.00)
    @ham = Item.new("ham", 1.50)
  end

  def test_item_got_name
    assert_equal("bread", @bread.name)
  end

  def test_item_got_price
    assert_equal(1.50, @ham.price)
  end

end
