class LineItem
  attr_accessor :item, :price, :count

  def initialize(item:)
    @count = 1
    @item = item
    @price = item.price
  end

  def increment_count
    @count += 1
  end

  def total
    price * count
  end
end