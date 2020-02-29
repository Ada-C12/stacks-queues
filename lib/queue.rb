class Queue
  
  def initialize()
    @store = Array.new(100)
    @front = 0
    @back = 0
  end
  
  def enqueue(element)
    raise StandardError, "Queue is full" if @front == @back && !front.nil?
    @store[@back] = element
    @back = (@back + 1) % @store.size
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
