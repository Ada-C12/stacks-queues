require 'linked_list.rb'

class Queue

  def initialize
    @store = LinkedList.new
  end

  def enqueue(element)
    @store.add_last(element)
  end

  def dequeue
    return @store.remove_first
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
