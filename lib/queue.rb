class Queue
  
  def initialize
    @store = Array.new(30)
    @front = @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    end
    
    ## this replaces the 'if' statement below that kept throwing an error when the queue was not full.
    if !@store[@back].nil? && @front == @back
      raise StandardError.new('queue is full.')
    end
    
    @store[@back] = element
    @back = (@back+1) % @store.length
    
    # if @front == @back % @store.length
    #   ## TODO:: this error is being hit before the queue is actually full - off by 1 :/
    #   raise StandardError.new('queue is full.')
    # end
    
  end
  
  def dequeue
    dequeued = @store[@front]
    
    # remove dequeued item from queue
    @store[@front] = nil
    # move front to next item in queue
    @front = @front+1
    
    return dequeued    
  end
  
  def front
    raise NotImplementedError, "Not yet implemented"
  end
  
  def size
    return @store.compact.length
    # raise NotImplementedError, "Not yet implemented"
  end
  
  def empty?
    if self.size == 0
      return true
    else
      return false
    end
    # raise NotImplementedError, "Not yet implemented"
  end
  
  # helper method for tests
  def length 
    return @store.length
  end
  
  def to_s
    @store.compact!
    return @store.to_s
  end
end
