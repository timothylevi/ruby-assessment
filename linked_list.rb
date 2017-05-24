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

  def print_values(curr_node)
    print "#{curr_node.value} --> "

    if !curr_node.next_node
      print "nil\n"
      return
    end

    print_values(curr_node.next_node)
  end

  def cycle?(curr_node)
    return false if !curr_node.next_node

    slow_pointer = curr_node
    fast_pointer = curr_node

    while fast_pointer && fast_pointer.next_node do
      slow_pointer = slow_pointer.next_node
      fast_pointer = fast_pointer.next_node.next_node

      return true if fast_pointer == slow_pointer
    end

    false
  end

  def reverse_list(curr_node)
    stack = Stack.new

    while curr_node do
      stack.push(curr_node.value)
      curr_node = curr_node.next_node
    end

    stack.pop
  end

  def reverse_list!(curr_node)
    last_node = nil
    next_node = curr_node.next_node

    while curr_node do
      next_node = curr_node.next_node
      curr_node.next_node = last_node
      last_node = curr_node
      curr_node = next_node
    end

    last_node
  end

  def reverse_list_recursive!(curr_node, prev_node = nil)
    next_node = curr_node.next_node
    curr_node.next_node = prev_node

    if !next_node
      return curr_node
    end

    reverse_list_recursive!(next_node, curr_node)
  end
end
