class BSTNode
  attr_accessor :left, :right, :parent, :value
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end
