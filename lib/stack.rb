# wave 1
require "./linked_list"
# require_relative './stack.rb'

class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    return @store.add_last(element)
  end

  def pop
    return @store.remove_last()
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
