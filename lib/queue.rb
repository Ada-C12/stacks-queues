class Queue

#   Using a circular buffer implement a Queue with the following methods:

# - `enqueue(value)` - Adds the value to the back of the queue.
# - `dequeue` - removes and returns a value from the front of the queue
# - `empty?` returns true if the queue is empty and false otherwise
  def initialize(size = 10)
    @store = Array.new(size)
    # front and back of buffer set to -1
    @front = @back = 0
    @empty = true
  end

  def enqueue(element)
    if @front == @back && @empty
      raise ArgumentError
    end
    @empty = false
  
    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    return nil if self.empty?
    if @store.length > 0
      return @store.shift
    end
  end

  def front
    return @store[@front]
  end

  def size
    return @store.size
  end

  def empty?
    return self.empty
  
  end

  def to_s
    return @store.to_s
  end
end


