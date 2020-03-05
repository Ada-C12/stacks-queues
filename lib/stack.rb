require 'linked_list'
class Stack
  # first in, last out, like a pile of books
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_last(element)
    return @store
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
