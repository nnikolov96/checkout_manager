require 'test_helper'

class ItemTest < Minitest::Test
  def setup
    @item = Item.new('001',"Very Cheap Chair", 9.25)
  end

  def test_should_have_price
    assert_equal 9.25, @item.price
  end

  def test_should_have_name
    assert_equal 'Very Cheap Chair', @item.name
  end

  def test_should_have_product_code
    assert_equal '001', @item.product_code
  end
end
