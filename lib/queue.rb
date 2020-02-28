class Queue
  def initialize
    @store = Array.new()
    # front and back of buffer
    @front = -1
    # for a buffer 
    # @back = -1
  end

  def enqueue(element)
    if @front == -1 #&& @back == -1
     @front = 0
    #  @back = 1
    elsif @front == @back
      # queue is full 
      # DECIDE what to do if queue is full 
      # raise error || make it bigger (see what the test requires)
    end

    @store << element
    # @back = (@back + 1) % @store.length
    
  end

  def dequeue
    if @front == -1
      return nil
    else
      return @store.shift
    end
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return true if @store.empty?
    return false
  end

  def to_s
    return @store.to_s
  end
end
