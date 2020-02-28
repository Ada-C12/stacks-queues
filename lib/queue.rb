require_relative './linked_list'

class Queue
  
  def initialize
    # @store = Array.new(10)
    # -1 is a flag to just say that this queue is empty
    # @front = @back = -1
    
    @store = LinkedList.new
  end
  
  def enqueue(element)
    # if @front == -1 
    #   @front = 0
    #   @back = 1
    # end
    
    # if @front == @back
    #   # decide
    # end
    
    # @store[@back] = element
    # @back = (@back + 1) % @store.length
    
    @store.add_last(element)
  end
  
  def dequeue 
    @store.remove_first
  end
  
  def front
    raise NotImplementedError, "Not yet implemented"
  end
  
  def size
    raise NotImplementedError, "Not yet implemented"
  end
  
  def empty?
    @store.empty?
  end
  
  def to_s
    return @store.to_s
  end
end
