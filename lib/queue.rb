class Queue
  
  def initialize
    @store = Array.new(30)
    @front = @back = 0
    
  end
  
  def enqueue(element)
    # if queue is full
    if ((@back + 1) % @store.length) == @front
      raise ArgumentError.new("Error: queue is full")
    end
    
    @store[@back] = element
    # Do the modulo so that you won't go over the end of the array
    @back = (@back + 1) % @store.length
  end
  
  def dequeue
    # when queue is empty
    if @front == @back
      raise ArgumentError.new("Error: queue is empty")
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
    if @front < @back
      return @back - @front
    else
      return @back - 1 + @store.length - (@front + 1)
    end
  end
  
  def empty?
    return true if @front == @back
    return false
  end
  
  def to_s
    if @front < @back
      @store = @store[@front...@back]
    elsif @front != @back
      @store = @store[@back..-1] + @store[0...@front]
    end
    return @store.to_s
  end
  
end
