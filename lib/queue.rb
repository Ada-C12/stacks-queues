class Queue
  
  def initialize
    @store = Array.new(10)
    @front = -1
    @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      front = 0
      back = 0
    end
    if @front == @back
      #look at test otherwise WE decide
    end
    @store[@back] = element
    @back = (@back +1) % @store.length
  end
  
  def dequeue
    if @front == @back 
      raise ArgumentError.new("Danger, Danger!")
    end
    
    if @front == -1 && @back == -1
      @front = 0
      @back = -1
    end
    
    element = @store[@front]
    @front = (@front + 1) % @store.length
    return element
  end
  
  def front
    return @store[@front]
  end
  
  def size
    if @front < @back
      return @back - @front
    else
      return @front - @back
    end
  end
  
  def empty?
    if @front == @back
      return true
    else
      return false
    end
  end
  
  def to_s
    return @store[@store...@back].to_s
  end
end
