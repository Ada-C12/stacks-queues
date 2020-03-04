require_relative 'linked_list'

class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_last(element)
  end

  def pop
    data = @store.get_last
    @store.remove_last()
    return data
  end

  def empty?
    return true if @store.empty?
    return false
  end

  def to_s
    return @store.to_s
  end
end
