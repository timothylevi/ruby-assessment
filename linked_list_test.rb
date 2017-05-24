require 'minitest/autorun'
require_relative './linked_list'

class LinkedListTests < MiniTest::Test
  def setup
    @node1 = LinkedList::Node.new(37)
    @node2 = LinkedList::Node.new(99, @node1)
    @node3 = LinkedList::Node.new(12, @node2)
  end

  def test_reverse_list_without_modification
    node3_next_node = @node3.next_node
    revlist = LinkedList.reverse_list(@node3)

    output, _err = capture_io do
      LinkedList.print_values(revlist)
    end

    assert_match(%r%37 --> 99 --> 12 --> nil%, output)
    assert(node3_next_node == @node3.next_node)
  end

  def test_iterative_reverse_list_with_modification
    node3_next_node = @node3.next_node
    revlist = LinkedList.reverse_list!(@node3)

    output, _err = capture_io do
      LinkedList.print_values(revlist)
    end

    assert_match(%r%37 --> 99 --> 12 --> nil%, output)
    assert(node3_next_node != @node3.next_node)
  end

  def test_recursive_reverse_list_with_modification
    node3_next_node = @node3.next_node
    revlist = LinkedList.reverse_list_recursive!(@node3)

    output, _err = capture_io do
      LinkedList.print_values(revlist)
    end

    assert_match(%r%37 --> 99 --> 12 --> nil%, output)
    assert(node3_next_node != @node3.next_node)
  end

  def test_has_cycle_with_no_cycle
    has_cycle = LinkedList.cycle?(@node3)

    assert(has_cycle == false)
  end

  def test_has_cycle_with_cycle
    @node1.next_node = @node3

    has_cycle = LinkedList.cycle?(@node3)

    assert(has_cycle == true)
  end
end
