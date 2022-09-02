require_relative 'promotional_rule/ten_percent_discount_rule'
require_relative 'promotional_rule/cheap_chair_discount_rule'

class RuleGenerator
  def self.initialize(name)
    case name
    when :ten_percent_discount then TenPercentDiscountRule.new
    when :cheap_chair_discount then CheapChairDiscountRule.new
    else
      raise ArgumentError.new, "No such rule"
    end
  end
end
