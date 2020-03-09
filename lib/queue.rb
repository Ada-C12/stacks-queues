class Queue
  def initialize(size = 10)
    @store = Array.new(size)
    @front = @back = 0
    @empty = true
  end

  def enqueue(element)
    if @front == @back && !@empty
      # this is quen the queue is full, throw error 
      raise ArgumentError
    else
      @back = (@back + 1) % @store.length
      @empty = false
      @store[@back] = element
    end
  end

  def dequeue
    value = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length
    if @front == @back
      @empty = true
    end
    return value
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return @empty
  end

  def to_s
    return @store.to_s
  end
end
