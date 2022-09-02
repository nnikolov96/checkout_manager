require 'test_helper'

class PromotionalRuleTest < Minitest::Test

  def test_should_apply_ten_percent_discount_when_total_over_60
    item_1 = Item.new('001',"Very Cheap Chair", 9.25)
    item_2 = Item.new('002','Little Table', 45.00)
  
    line_item_1 = LineItem.new(item: item_1)
    line_item_2 = LineItem.new(item: item_2)
  
    line_item_1.increment_count
  
    pr = PromotionalRule.new(:ten_percent_discount)
    line_items = pr.apply([line_item_1, line_item_2])
  
    assert_equal 57.15, line_items.sum(&:total)
  end
  
  def test_should_not_apply_ten_percent_discount_when_total_not_over_60
    item_1 = Item.new('001',"Very Cheap Chair", 9.25)
    item_2 = Item.new('002','Little Table', 45.00)
  
    line_item_1 = LineItem.new(item: item_1)
    line_item_2 = LineItem.new(item: item_2)
  
    pr = PromotionalRule.new(:ten_percent_discount)
    line_items = pr.apply([line_item_1, line_item_2])
  
    assert_equal 54.25, line_items.sum(&:total)
  end

  def test_should_apply_discount_on_cheap_chairs_when_more_than_one_chair
    item_1 = Item.new('001',"Very Cheap Chair", 9.25)
    line_item_1 = LineItem.new(item: item_1)

    line_item_1.increment_count

    pr = PromotionalRule.new(:cheap_chair_discount)
    line_items = pr.apply([line_item_1])

    assert_equal 17.0, line_items.sum(&:total)
  end

  def test_should_not_apply_discount_on_cheap_chairs_when_only_one_chair
    item_1 = Item.new('001',"Very Cheap Chair", 9.25)
    line_item_1 = LineItem.new(item: item_1)

    pr = PromotionalRule.new(:cheap_chair_discount)
    line_items = pr.apply([line_item_1])

    assert_equal 9.25, line_items.sum(&:total)
  end

  def test_should_raise_error_if_empty_array_is_passed_to_promotional_rule
    pr = PromotionalRule.new(:ten_percent_discount)
    assert_raises ArgumentError do
      line_items = pr.apply([])
    end
  end
end
