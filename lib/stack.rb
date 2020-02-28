require_relative './linked_list.rb'

class Stack
  def initialize
    @store = LinkedList.new
    # @front = -1
    # @back = -1
  end

  def push(element)
    return @store.add_last(element)
  end

  def pop
    return @store.remove_last()
  end

  def empty?
    return true if @store.get_last.nil?
  end

  def to_s
    return @store.to_s
  end
end
