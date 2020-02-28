class Queue

  def initialize
    @store = Array.new(10)
    @front = -1
    @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end

    if @front == @back
      raise ArgumentError.new("Error: queue is full")
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end

    if @front == @back
      raise ArgumentError.new("Error: queue is empty")
    end

    @store[@back] = nil
    @back = (@back + 1) % @store.length
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    raise NotImplementedError, "Not yet implemented"
  end

  def to_s
    return @store.to_s
  end
end
