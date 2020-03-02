class Queue
  def initialize
    @store = Array.new(50)
    @front = @back = -1
  end
  
  def enqueue(element)
    # queue is empty
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end
    
    # queue is full
    if @front == @back
      raise ArgumentError, "Queue is full"
    end    
    
    @store[@back] = element
    @back = (@back + 1) % @store.length
    
    if @store[@front].nil?
      @front = (@front + 1) % @store.length
    end
  end
  
  def dequeue
    if @front == -1
      raise ArgumentError, "Queue is empty"
    end  
    
    removed = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length  
    return removed
  end
  
  def front
    return @store[@front]
  end
  
  def size
    return @store[@front...@back].length
  end
  
  def empty?
    return @front == -1
  end 
  
  def to_s
    return @store[@front...@back].to_s
  end
end 
