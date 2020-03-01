require_relative './linked_list'

class Stack
  def initialize
    @store = LinkedList.new()
  end

  def push(element)
    return @store.add_last(element)
  end

  def pop
    return @store.remove_last()
  end

  def empty?
    return @store.empty? ? true : false
  end

  def length
    return @store.length()
  end

  def get_last
    return @store.get_last()
  end

  def to_s
    return @store.to_s
  end
end
