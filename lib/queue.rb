class Queue
  
  def initialize
    # @store = ...
    @store = Array.new(10)
    @front = @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
      
    end
    
    if @front == @back
      raise ArgumentError, "Queue is full."
    end
    
    @store[@back] = element
    @back = (@back + 1) % @store.length
    if front.nil?
      @front = (@front + 1) % @store.length
    end
    
  end
  
  def dequeue
    if (size == 0)
      return nil
    end
    
    temp = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length
    return temp
  end
  
  def front
    return @store[@front]
  end
  
  def size
    return @store.compact.size
  end
  
  def empty?
    return size == 0
  end
  
  def to_s
    return @store[@front...@back].to_s
  end
end
