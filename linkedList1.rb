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

  while (list_node != nil) do
    stack.push(list_node.value)
    list_node = list_node.next_node
  end

  return stack.pop
end

def reverse_list_mutate(list_node)
  curr_node = list_node
  last_node = nil
  next_node = list_node.next_node

  while (curr_node != nil) do
    next_node = curr_node.next_node
    curr_node.next_node = last_node
    last_node = curr_node
    curr_node = next_node
  end

  return last_node
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(element)
    @data = LinkedListNode.new(element, @data)
  end

  def pop
    return nil if not @data

    last_item = @data
    @data = last_item.next_node

    return last_item
  end
end
