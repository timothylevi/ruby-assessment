require 'minitest'

module LinkedList
  module_function

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end

    def to_s
     "Value:#{@value}\tNext:#{@next_node}"
    end
  end

  class Stack
    attr_reader :data

    def initialize
      @data = nil
    end

    def push(element)
      @data = Node.new(element, @data)
    end

    def pop
      return nil if !@data

      last_item = @data
      @data = last_item.next_node

      last_item
    end

    def to_s
     "Data:#{@data}"
    end
  end

  def print_values(list_node)
    print "#{list_node.value} --> "

    if !list_node.next_node
      print "nil\n"
      return
    end

    print_values(list_node.next_node)
  end

  def cycle?(list_node)
    return false if !list_node.next_node

    slow = list_node
    fast = list_node.next_node

    while fast && fast.next_node do
      slow = slow.next_node
      fast = fast.next_node.next_node

      return true if fast == slow
    end

    false
  end

  def reverse_list(list_node)
    stack = Stack.new

    while list_node do
      stack.push(list_node.value)
      list_node = list_node.next_node
    end

    stack.pop
  end

  def reverse_list!(list_node)
    curr_node = list_node
    last_node = nil
    next_node = list_node.next_node

    while curr_node do
      next_node = curr_node.next_node
      curr_node.next_node = last_node
      last_node = curr_node
      curr_node = next_node
    end

    last_node
  end

  def reverse_list_recursive!(list_node, prev_node = nil)
    next_node = list_node.next_node
    list_node.next_node = prev_node

    if !next_node
      return list_node
    end

    reverse_list_recursive!(next_node, list_node)
  end
end
