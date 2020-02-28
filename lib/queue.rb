require_relative "linked_list"

class Queue
  def initialize
    # @store = ...
    @store = Array.new(100)
    @front = @back = -1
  end

  def enqueue(element)
    @store.add_last(element)
  end

  def dequeue
    return nil if self.empty?
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    raise NotImplementedError, "Not yet implemented"
  end

  def to_s
    return @store.empty?
  end
end
