class Queue

  def initialize

    # # # assume fixed array length is 10
    # @store = Array.new(10)
    
    # initialize front and back both at the same place
    @front = -1 
    @back = -1

    # create empty array
    @store = []
  end

  def enqueue(element)
    # implementing circular buffer to keep track of array's front index (so insertions will be O of 1 -- would be O of n with if we used shovel/push)
    
    # if queue has space, move back to the next free position, i.e. next position clockwise
    
    # why is size one less than length?
    size = @store.length-1

    # wraparound
    if (@back == size-1)
      @back = 0
    # no wraparound
    else
      @back += 1
    end

    # if the queue is full 
    if @front == @back
      # tests require that the queue be resized 

    end

    # @store[@back] = element
    # # use mod to wrap around
    # @back = (@back + 1) % @store.length
    
    @store[@back] = element

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
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
