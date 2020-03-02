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
    
    if !@store[@back].nil? && @front == @back
      raise StandardError.new('queue is full.')
    end
    
    @store[@back] = element
    @back = (@back+1) % @store.length
    
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
    return @store[@front]
  end
  
  def size
    return @store.compact.length
  end
  
  def empty?
    if self.size == 0
      return true
    else
      return false
    end
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
