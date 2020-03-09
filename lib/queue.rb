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
      @store[@back] = element
      @empty = false
      @back = (@back + 1) % @store.length
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
    return @store[@front]
  end

  def size
    return @store.size
  end

  def empty?
    return @empty
  end

  def to_s
    return @store.to_s
  end
end


