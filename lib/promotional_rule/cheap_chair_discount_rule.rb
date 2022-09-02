require_relative 'generic_rule'

class CheapChairDiscountRule < GenericRule
  attr_reader :name, :priority

  PRIORITY = 1
  DISCOUNTED_001_PRICE = 8.50

  def initialize
    @name = :discounted_001
    @priority = PRIORITY
  end
end
