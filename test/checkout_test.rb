require 'test_helper'

class CheckoutTest < Minitest::Test
  def setup
    rules = [{ name: :ten_percent_discount, priority: 2 }, { name: :cheap_chair_discount, priority: 1}]
    @co = Checkout.new(rules)

    @item_1 = Item.new('001',"Very Cheap Chair", 9.25)
    @item_2 = Item.new('003',"Funky Light", 19.95)
    @item_3 = Item.new('002','Little Table', 45.00)
  end

  def test_should_equal_36_95
    @co.scan(@item_1)
    @co.scan(@item_2)
    @co.scan(@item_1)
    
    assert_equal @co.total, 36.95
  end

  def test_should_apply_ten_percent_discount
    @co.scan(@item_1)
    @co.scan(@item_2)
    @co.scan(@item_3)
    
    assert_equal @co.total, 66.78
  end

  def test_should_apply_both_discounts
    @co.scan(@item_1)
    @co.scan(@item_2)
    @co.scan(@item_3)
    @co.scan(@item_1)

    assert_equal @co.total, 73.76
  end
end