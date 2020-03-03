class Queue
  
  def initialize
    @store = Array.new(30)
    @front = @back = 0
    # full when front == back
  end
  
  def enqueue(element)
    # don't care when queue is empty
    # only care if it's full
    
    if @front == (@back + 1) % @store.length
      raise ArgumentError, 'queue is currently full'
    end
    
    @store[@back] = element
    @back = (@back + 1) % @store.length
  end
  
  def dequeue 
    # only care if queue is empty
    if @front == @back
      raise ArgumentError, 'the queue is empty'
    end
    
    removed = @store[@front]
    
    @store[@front] = nil
    @front = (@front + 1) % @store.length
    
    return removed
  end
  
  def front
    raise NotImplementedError, "Not yet implemented"
  end
  
  def size
    raise NotImplementedError, "Not yet implemented"
  end
  
  def empty?
    return @front == @back
  end
  
  def to_s
    return @store.compact.to_s
  end
end
