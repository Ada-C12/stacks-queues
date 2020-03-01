class Queue
  
  def initialize
    # how do we know what the size of the queue is going to be?
    @store = Array.new() 
    
    # this has an index of -1 to indicate these are empty
    @front = -1
    @back = -1
    
  end
  
  def enqueue(value)
    if @front == -1 && @back == -1
      @store.push(value)
    else
      @store.push(value)
    end
  end
  
  def dequeue
    
    
  end
  
  def front
    raise NotImplementedError, "Not yet implemented"
  end
  
  def size
    raise NotImplementedError, "Not yet implemented"
  end
  
  def empty?
    if @front == -1 && @back == -1
      return true
    else
      return false
    end
  end
  
  def to_s
    return @store.to_s
  end
end
