class Queue

  def initialize
    @store = Array.new(10)
    @front = -1 
    @back = -1
  end

  def enqueue(element)
    #Circular buffer method
    #Check if queue is empty
    if @front == -1 && @back == -1
      @front = 0
      @back = 1 
    end 

    #Check if queue is full
    if ((@back + 1) % @store.length) == @front
      raise ArgumentError.new("Queue is full!")
    end

    @store[@back] = element
    #Make it wrap around when it reaches the end & use modulo to not go over the end
    @back = (@back + 1) % @store.length
  end

  def dequeue
    if @front == @back
      raise ArgumentError.new("Queue is empty!")
    end
    
    #Store the current first element in a temp
    temp = @store[@front]
    #Make the front element nil 
    @store[@front] = nil

    @front = (@front + 1) % @store.length
    
    return temp
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
