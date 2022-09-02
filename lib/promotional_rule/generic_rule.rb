class GenericRule
  def apply(line_items)
    raise NotImplementedError, 'You must implement the apply method'
  end
end
