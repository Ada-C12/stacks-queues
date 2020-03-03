class Queue

  def initialize
    @store = Array.new(10)
    @front = -1 
    @back = -1
  end

  def enqueue(element)
    #Check if queue is empty
    if @front == -1 && @back == -1
      @front = 0
      @back = 1 
    end 
    #Check if queue is full
    if @front == @back
      #Decide what to do if circular buffer is full 
    end 

    @store(@back) = element 
    @back += 1 

    #Make it wrap around when it reaches the end 
    @back = (@back + 1) % @store.length
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
    return @store.to_s
  end
end
