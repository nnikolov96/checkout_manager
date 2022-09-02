require_relative 'generic_rule'

class CheapChairDiscountRule < GenericRule
  attr_reader :priority

  PRIORITY = 1
  DISCOUNTED_001_PRICE = 8.50

  def initialize
    @priority = PRIORITY
  end

  def apply(line_items)
    raise ArgumentError.new, 'Line items should be present' if line_items.empty?

    cheap_chairs = line_items.find { |line_item| line_item.item.product_code == "001" }
    if cheap_chairs && cheap_chairs.count > 1
      line_items = line_items.map do |line_item|
        line_item.price = line_item.item.product_code == '001' ? DISCOUNTED_001_PRICE : line_item.price
        line_item
      end
    end

    line_items
  end
end
