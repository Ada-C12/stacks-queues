class Queue

  def initialize
    # assume fixed array length is 10
    @store = Array.new(10)
    
    # currently front and back are both at 'front' of the queue
    @front = -1 
    @back = -1
  end

  def enqueue(element)
    # adding to an empty queue
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end

    # if the queue is full 
    if @front == @back
      # tests require that the queue be resized 
    end

    @store[@back] = element
    # use mod to wrap around
    @back = (@back + 1) % @store.length


  end

  def dequeue
    # increase at the front
    # check that the queue is empty when you reach the end
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
