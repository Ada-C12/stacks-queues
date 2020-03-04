class Queue

  def initialize
    @store = Array.new(100)
    @front = -1
    @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    end

    @store[@back] = element
    if (@back = (@back + 1) % @store.length) == @front
      raise ArgumentError.new("Error: queue is full")
    end
  end

  def dequeue
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end
    if @front == @back
      raise ArgumentError.new("Error: queue is empty")
    end
    element = @store[@front]
    @front = (@front + 1) % @store.length
    return element
  end

  def front
    return @store[@front]
  end

  def size
    if @front < @back
      return @back - @front
    else
      return @front - @back
    end
  end

  def empty?
    if @front == @back
      return true
    else
      return false
    end
  end

  def to_s
    return @store[@front...@back].to_s
  end
end
