class Node
  attr_accessor :value, :next_node

  def initialize(value)
    self.value = value
  end

  def to_s
    value
  end
end

# node = Node.new()
# p node.value
# p node.next_node