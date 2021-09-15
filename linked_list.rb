require_relative 'node'

class LinkedList
  attr_accessor :size, :head, :tail

  def initialize
    super
    self.size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if size == 0
      self.head = new_node
      self.tail = new_node
    else
      self.tail.next_node = new_node
      self.tail = new_node
    end
    self.size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if size == 0
      self.head = new_node
      self.tail = new_node
    else
      new_node.next_node = self.head
      self.head = new_node
    end
    self.size += 1
  end

  def at(index)
    return nil if index >= size
    node = head
    index.times do
      node = node.next_node
    end
    return node
  end

  def pop
    return nil if size == 0

    res = self.tail
    at(size - 2).next_node = nil
    self.tail = at(size - 2)
    self.size -= 1
    
    res
  end

  def contains?(value)
    node = head
    loop do
      return true if node.value == value

      break if node.next_node.nil?

      node = node.next_node
    end
    false
  end

  def find(value)
    index = 0
    node = head

    loop do
      return index if node.value == value

      break if node.next_node.nil?

      node = node.next_node
      index += 1
    end

    nil
  end

  def to_s
    return 'nil' if size == 0

    string = ''
    node = head
    loop do
      string << "( #{node.value} ) -> "
      break if node.next_node.nil?
      node = node.next_node
    end

    string << "nil"

    string
  end
end

list = LinkedList.new()
list.append('one')
list.append('two')
list.prepend('zero')
puts list.at(0)
puts list.at(1)
puts list.at(2)
list.pop
list.append('too')
puts list.at(2)
p list.at(3)
p list.size
p list.contains? 'two'
p list.contains? 'too'
p list.find 'one'
p list.find 'two'
puts list