class Queue
  
  def initialize
    @store = Array.new(10)
    @front = @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end
    if @front == @back
      puts 'queue is full, sorry!'
      return
    end
    @store[@back-1] = element
    @back = (@back + 1) % @store.length # to get back to index 0
  end
  
  def dequeue
    if @front == -1 && @back == -1
      puts 'queue is empty, sorry!'
      return
    end
    value = @store[@front]
    @front = (@front + 1) % @store.length
    return value
  end
  
  def front
    raise NotImplementedError, "Not yet implemented"
  end
  
  def size
    raise NotImplementedError, "Not yet implemented"
  end
  
  def empty?
    return true if @front == -1 && @back == -1
    return false
  end
  
  def to_s
    return @store.to_s
  end
end
