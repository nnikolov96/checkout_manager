require 'test_helper'
require 'rule_generator'
require 'item'

class RuleGeneratorTest < Minitest::Test
  def test_should_create_ten_percent_discount_rule_object
    assert_instance_of TenPercentDiscountRule, RuleGenerator.initialize(:ten_percent_discount)
  end

  def test_should_create_cheap_chair_discount_rule_object
    assert_instance_of CheapChairDiscountRule, RuleGenerator.initialize(:cheap_chair_discount)
  end

  def test_should_raise_argument_error_if_rule_not_found
    assert_raises ArgumentError do
      RuleGenerator.initialize(:no_rule)
    end
  end
end
