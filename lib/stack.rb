require_relative './linked_list.rb'

class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_last(element)
    return @store
  end

  def pop
    return @store.remove_last if @store.get_first != nil 
  end

  def empty?
    if @store.get_first == nil
      return true 
    end
  end

  def to_s
    return @store.to_s
  end
end
