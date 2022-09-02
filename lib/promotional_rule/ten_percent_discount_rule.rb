require_relative 'generic_rule'

class TenPercentDiscountRule < GenericRule
  attr_reader :name, :priority

  PRIORITY = 2

  def initialize
    @name = :ten_percent_discount
    @priority = PRIORITY
  end
end
