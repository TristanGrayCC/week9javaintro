require('minitest/autorun')
require('minitest/rg')
require_relative('../shopping_basket')

class TestItem < MiniTest::Test

  def setup
    @item1 = Item.new("bread", 1.00)
    @item2 = Item.new("ham", 1.50)
    @item3 = Item.new("delux_turkey", 18.50)
    @shopping_basket1 = Shopping_Basket.new("Tuesday", [@item1, @item2], "No")
    @shopping_basket2 = Shopping_Basket.new("Wednesday", [], "No")
    @shopping_basket3 = Shopping_Basket.new("Thursday", [@item1, @item2, @item3], "No")
    @shopping_basket4 = Shopping_Basket.new("Thursday", [@item1, @item2], "Yes")
    @shopping_basket5 = Shopping_Basket.new("Thursday", [@item1, @item1, @item2], "No")
  end

  def test_basket_got_name
    assert_equal("Tuesday", @shopping_basket1.name)
  end

  def test_basket_got_items
    assert_equal([@item1, @item2], @shopping_basket1.contents)
  end

  def test_add_item
    @shopping_basket2.add_item(@item1)
    assert_equal([@item1], @shopping_basket2.contents)
  end

  def test_remove_item
    @shopping_basket1.remove_item(@item1)
    assert_equal([@item2], @shopping_basket1.contents)
  end

  def test_empty_contents
    @shopping_basket1.delete_contents
    assert_equal([], @shopping_basket1.contents)
  end

  def test_total_price
    assert_equal(2.50, @shopping_basket1.total_price)
  end

  def test_price_discount
    assert_equal(18.90, @shopping_basket3.total_price)
  end

  def test_price_and_card_discount
    assert_equal(2.45, @shopping_basket4.total_price)
  end

  def test_bogof_discount
    assert_equal(2.50, @shopping_basket5.total_price)
  end

end
