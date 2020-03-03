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
    # implementing circular buffer to keep track of array's front and back indices (so insertions/deletions will be O of 1 -- would be O of n with if we used shovel/push)

    # if queue has space, move @back to the next free position, i.e. next position clockwise

    @back = (@back + 1) % size

    @store[@back] = element

    # resize queue if full: in this implementation, queue resizes at every multiple of 10 and reorders with front at index 0
    if @front == @back && !@is_empty 
      # add the new spaces after the 'back' of the queue
      new_queue_a = @store[@front+1..-1]
      new_queue_b = @store[0..@back-1]
      new_queue_c = Array.new(10)
      @back = @store.length - 1
      @store = new_queue_a + new_queue_b + new_queue_c
      @store[@back] = element
      @front = -1

    end
        
    # if queue is empty, change to not empty
    if @is_empty
      @is_empty = false
    end

  end

  def dequeue
    # increase at the front
    # check that the queue is empty when you reach the end

    @front = (@front + 1) % size

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
    # why is size one less than length? Is it because we're leaving an empty cell to indicate when array isn't full?
    return @store.length
  end

  def empty?
    return @is_empty
  end

  def to_s
    return @store.to_s
  end
end
