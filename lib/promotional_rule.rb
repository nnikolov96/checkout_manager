class PromotionalRule
  DISCOUNTED_001_PRICE = 8.50

  def initialize(rule_name)
    @rule_name = rule_name
    @line_items = []
  end

  def apply(line_items)
    @line_items = line_items
    send(@rule_name)
  end

  def cheap_chair_discount()
    cheap_chairs = @line_items.find { |line_item| line_item.item.product_code == "001" }
    if cheap_chairs && cheap_chairs.count > 1
      @line_items = @line_items.map do |line_item|
        line_item.price = line_item.item.product_code == '001' ? DISCOUNTED_001_PRICE : line_item.price
        line_item
      end
    end

    @line_items
  end

  def ten_percent_discount()
    total = @line_items.sum(&:total)

    if total > 60
      @line_items.map do |line_item|
        line_item.price = line_item.price - (line_item.price * 0.1)
        line_item
      end
    else
      @line_items
    end
  end
end