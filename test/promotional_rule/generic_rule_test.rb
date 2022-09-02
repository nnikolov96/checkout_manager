require 'test_helper'

class GenericRuleTest < Minitest::Test
  def test_should_raise_error_on_init
    assert_raises StandardError do
      GenericRule.new
    end
  end

  def test_should_raise_error_when_apply_not_implemented
    assert_raises NotImplementedError do
      GeneriRuleWithoutApply.new.apply
    end
  end

  class GeneriRuleWithoutApply < GenericRule
    def initialize; end
  end
end