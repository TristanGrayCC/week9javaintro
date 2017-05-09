require_relative('item')

class Shopping_Basket

  attr_reader :name, :contents, :discount_card

  def initialize(name, contents = [], discount_card)
    @name = name
    @contents = contents
    @discount_card = discount_card
  end

  def add_item(item)
    contents << item
  end

  def remove_item(item)
    contents.delete(item)
  end

  def delete_contents
    contents.clear
  end

  def total_price
    @price = 0.00
    for item in contents
      @price += item.price
    end
    bogof_discount(@price, contents)
    price_discount(@price)
    card_discount(@price)
    return @price.round(2)
  end

  def price_discount(price)
    if price > 20.00
      @price = price*0.9
    end
    return @price
  end

  def card_discount(price)
    if discount_card == "Yes"
      @price = price*0.98
    end
    return @price
  end

  def bogof_discount(price, contents)
    duplicates = contents.group_by{|e| e}.keep_if{|_, e| e.length > 1}
    dup_items = duplicates.keys
    for item in dup_items
      @price -= item.price
    end
    return @price
  end

end
