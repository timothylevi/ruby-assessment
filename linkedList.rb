# Reversing a Linked List
class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

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

def reverse_list_mutate_recursive(list_node, prev_node=nil)
  next_node = list_node.next_node
  list_node.next_node = prev_node

  if next_node == nil
    return list_node
  end

  return reverse_list_mutate_recursive(next_node, list_node)
end

def detect_cycle(list_node)
  return false if list_node.next_node == nil

  slow = list_node
  fast = list_node.next_node

  while (fast != nil && fast.next_node != nil) do
    slow = slow.next_node
    fast = fast.next_node.next_node

    return true if fast == slow
  end

  return false
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
