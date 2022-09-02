require 'test_helper'

class LineItemTest < Minitest::Test
  def setup
    item = Item.new('001',"Very Cheap Chair", 9.25)
    @line_item = LineItem.new(item: item)
  end

  def test_should_increment_count
    @line_item.increment_count

    assert_equal 2, @line_item.count
  end

  def test_should_calculate_total
    @line_item.increment_count

    assert_equal 18.5, @line_item.total
  end
end
