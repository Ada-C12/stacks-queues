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
    
    if ((@back + 1) % @store.length) == @front
      raise StandardError.new
    end
    
    @store[@back] = element
    @back = (@back + 1) % @store.length
  end
  
  def dequeue
    raise StandardError.new if @front == @back
    
    dequeued = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length
    
    return dequeued
  end
  
  def front
    return @front 
  end
  
  def size
    queue = []
    
    if @front >= @back
      queue = (@store[@front...-1] + @store[0...@back])
    else
      queue = @store[@front...@back]
    end
    
    return queue.length
  end
  
  def empty?
    if @front == @back
      return true
    else
      return false
    end
  end
  
  def to_s
    if @front >= @back
      return (@store[@front...-1] + @store[0...@back]).to_s
    else
      return @store[@front...@back].to_s
    end
  end
end
