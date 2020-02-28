class Queue
  
  def initialize
    @store = Array.new(100)
    @front = @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
      
    end
    
    if @front == @back
      # DECIDE...something
      # return @store
    end
    
    @store[@back] = element
    @back = (@back + 1) % @store.length
    if @store[@front].nil?
      @front = (@front + 1) % @store.length
    end
    
  end
  
  def dequeue
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
    return @store[@front...@back].to_s
  end
end
