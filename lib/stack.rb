require_relative 'linked_list'

class Stack
  
  def initialize
    @store = LinkedList.new()
    @top = -1
    @bottom = -1    
  end
  
  
  
  def push(element)
    @store.add_last(element)
  end
  
  def pop
    return @store.remove_last
  end
  
  def empty?
    if @top == -1 && @bottom == -1
      return true
    else
      return false
    end
  end
  
  def to_s
    return @store.to_s
  end
  
end
