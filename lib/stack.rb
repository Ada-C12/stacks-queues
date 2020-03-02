# wave 1
require "./linked_list"
# require_relative './stack.rb'

class Stack
  def initialize
    @store = LinkedList.new
    # @front = -1
    # raise NotImplementedError, "Not yet implemented"
  end

  def push(element)
    # raise NotImplementedError, "Not yet implemented"
    return @store.add_last(element)
  end

  def pop
    # raise NotImplementedError, "Not yet implemented"
    return @store.remove_last()
  end

  def empty?
    # raise NotImplementedError, "Not yet implemented"
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
