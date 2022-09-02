require_relative 'generic_rule'

class TenPercentDiscountRule < GenericRule
  attr_reader :priority

  PRIORITY = 2

  def initialize
    @priority = PRIORITY
  end

  def apply(line_items)
    raise ArgumentError.new, 'Line items should be present' if line_items.empty?

    total = line_items.sum(&:total)

    return line_items if total <= 60

    line_items.map do |line_item|
      line_item.price = line_item.price - (line_item.price * 0.1)
      line_item
    end
  end
end
