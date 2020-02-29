class Queue
  
  def initialize(capacity = 100)
    @store = Array.new(capacity)
    @front = -1
    @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end
    
    raise StandardError, "Queue is full"if @front == @back
    
    @store[@back] = element
    @back = (@back + 1) % @store.size
    @front = (@front + 1) % @store.size if front.nil?
  end
  
  def dequeue
    element = front
    if element
      @store[@front] = nil
      @front = (@front + 1) % @store.size
    end
    return element
  end
  
  def front
    return @store[@front]
  end
  
  def size
    return @store.compact.size
  end
  
  def empty?
    return front == nil
  end
  
  def to_s
    queue = []
    if front
      current_index = @front
      while current_index != @back
        queue << @store[current_index]
        current_index = (current_index + 1) % @store.size
      end
    end
    return queue.to_s
  end
end
