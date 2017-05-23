# Reversing a Linked List
class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(list_node)
  stack = Stack.new
  stack.push(list_node)

  last_node = nil
  curr_node = stack.pop

  while (curr_node != nil) do
    curr_node.next_node = last_node
    last_node = curr_node
    curr_node = stack.pop
  end

  return last_node
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(element)
    @data = element
  end

  def pop
    return nil if not @data

    last_item = @data
    @data = last_item.next_node

    return last_item
  end
end
