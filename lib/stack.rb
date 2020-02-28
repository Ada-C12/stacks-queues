require_relative './linked_list.rb'
class Stack
  def initialize
    @store = LinkedList.new
    # raise NotImplementedError, "Not yet implemented"
  end

  def push(element)
    if @store.nil?
      @store.add_first(element)
    else
      @store.add_last(element)
    end
    # raise NotImplementedError, "Not yet implemented"
  end

  def pop
    @store.remove_last()
  end

  def empty?
    if @store.empty? 
      return true
    else
      return false
    end
  end

  def to_s
    return @store.to_s
  end
end
