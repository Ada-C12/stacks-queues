class Queue
  
  def initialize
    @store = Array.new(100)
    # we don't have a front and back yet so they're both -1
    @front = @back = -1
    
  end
  
  def enqueue(element)
    # if queue is empty
    if @front == -1 && @back == -1
      @front = 0
      # because there will be one element after we enqueue the first one
      @back = 1
    end
    
    # if queue is full
    if @front == @back
      raise ArgumentError.new("Error: queue is full")
    end
    
    @store[@back] = element
    # Do the modulo so that you won't go over the end of the array
    @back = (@back + 1) % @store.length
  end
  
  def dequeue
    # when queue is empty change front and back to -1 so that you know it's empty
    
    raise NotImplementedError, "Not yet implemented"
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
    return @store.to_s
  end
end
