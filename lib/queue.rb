class Queue

  def initialize

    # # assume fixed array length is 10
    @store = Array.new(10)
    
    # initialize front and back both at the same place
    @front = -1
    @back = -1

    # default status is empty
    @is_empty = true
  end

  def enqueue(element)
    # implementing circular buffer to keep track of array's front index (so insertions will be O of 1 -- would be O of n with if we used shovel/push)
    
    # if queue has space, move back to the next free position, i.e. next position clockwise
    
    # why is size one less than length? Is it because we're leaving an empty cell to indicate array isn't full?
    # size = @store.length-1

    # below could also be written `back = (back + 1) % size`
    if @back == size-1
      @back = 0
    else
      @back += 1
    end

    # resize queue if full 
    if @front == @back && !@is_empty
      # raise ArgumentError, "Queue is full"
      new_queue_a = @store.dup
      new_queue_b = Array.new(10)
      @store = new_queue_a + new_queue_b
    end

    # # use mod to wrap around
    # @back = (@back + 1) % @store.length
    
    @store[@back] = element

    # if current status is empty, change to not empty
    if @is_empty
      @is_empty = false
    end

  end

  def dequeue
    # increase at the front
    # check that the queue is empty when you reach the end

    # size = @store.length

    if @front == size-1
      @front = 0
    else
      @front += 1
    end

    # update is_empty for empty queue
    if @front == @back
      @is_empty = true
    end

    removed = @store[@front]

    # initially used delete_at(@front) but reassigning value to nil preserves fixed array size
    @store[@front] = nil

    # return the element that was removed
    return removed
  end

  def front
    @front
  end

  def size
    # why is size one less than length? Is it because we're leaving an empty cell to indicate array isn't full?
    return @store.length-1
  end

  def empty?
    return @is_empty
  end

  def to_s
    return @store.to_s
  end
end
