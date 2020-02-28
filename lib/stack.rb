require "linked_list"

class Stack
  def initialize
    @store = LinkedList.new
    @front = -1
  end

  def push(element)
    @store.add_first(element)
  end

  def pop
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    raise NotImplementedError, "Not yet implemented"
  end

  def to_s
    return @store.to_s
  end
end
