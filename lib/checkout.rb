require 'rule_generator'
require 'line_item'

class Checkout
  attr_accessor :line_items, :promotional_rules

  def initialize(promotional_rules = [])
    @line_items = []
    @promotional_rules = promotional_rules.map { |rule| RuleGenerator.initialize(rule[:name]) }
  end

  def scan(new_item)
    line_item = @line_items.find { |line_item| line_item.item.product_code == new_item.product_code }

    if line_item
      line_item.increment_count
    else
      @line_items << LineItem.new(item: new_item)
    end
  end

  def total
    @promotional_rules.sort_by(&:priority).each do |rule|
      @line_items = rule.apply(@line_items)
    end

    @line_items.sum(&:total).round(2)
  end
end
