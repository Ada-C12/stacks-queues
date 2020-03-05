class Queue
  
  def initialize
    @store = Array.new(100)
    @front = @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
      
    end
    
    if @front == @back
      raise ArgumentError, "Queue if full!"
    end
    
    @store[@back] = element
    @back = (@back + 1) % @store.length
    if front.nil?
      @front = (@front + 1) % @store.length
    end
    
  end
  
  def dequeue
   return nil if size == 0

    ejected_element = front
    @store[@front] = nil  # weird that I couldn't use front on this one; when I do it failed 5 tests

    @front = (@front + 1) % @store.length

    return ejected_element

  end

  
  def front
    return @store[@front]
  end
  
  def size
    return @store.compact.size
  end
  
  def empty?
    return size == 0
  end
  
  def to_s
    queue = []
    if size != 0
      size.times do
        queue << @store[@front]
        @front = (@front + 1) % @store.size
      end
    end
    return queue.to_s

    # originally just had: return @store.compact.to_s (which passed the tests)
    # Eve caught an untested edge case
      # queue = [2, 3, nil, nil, 1] where index 4 is @front and index 1 is @back
      # expected => [1, 2, 3]
      # actual result from current method => [2, 3, 1]
    # above method should fix the edge case Eve thought of

  end
end
