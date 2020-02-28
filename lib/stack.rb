require_relative '../lib/linked_list'

class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_last(element)
  end

  def pop
    return nil if empty?
    return @store.remove_last
  end

  def empty?
    return @store.empty?
  end

  def to_s
    @store.to_s
  end
end
