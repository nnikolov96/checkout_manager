class GenericRule
  def initialize
    raise 'Cannot initialize an abstract generic rule'
  end
  def apply(line_items = [])
    raise NotImplementedError, 'You must implement the apply method'
  end
end
