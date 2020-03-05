class Queue
  def initialize
    @store = Array.new(30)
    @front = @back = -1
  end
  
  def enqueue(element)
    # queue is empty
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
      @store[@front] = element
      
    elsif @front == @back
      #queue is full
      raise ArgumentError, "Queue is full"
      
    else      
      @store[@back] = element
      @back = (@back + 1) % @store.length
    end
  end
  
  def dequeue
    if @front == -1
      raise ArgumentError, "Queue is empty"
    end  
    
    removed = @store[@front]
    @front = (@front + 1) % @store.length  
    
    if @front == @back
      @front = @back = -1
    end 
    
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
    list = []
    current = @front
    
    while current != @back
      list << @store[current]
      current = (current + 1) % @store.length
    end
    return list.to_s
  end
end 
