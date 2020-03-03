class Queue

  def initialize
    # @store = ...
    # raise NotImplementedError, "Not yet implemented"
    @store = Array.new(100)
    @front = @back = -1
    # @front = -1
    # @back = -1
  end

  def enqueue(element)
    # raise NotImplementedError, "Not yet implemented"
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
      @store[@front] = element
    elsif @front == @back
      #DECIDE
      raise ArgumentError, "Queue is full!"
    else
      @store[@back] = element
      @back = (@back + 1) % @store.length
    end
  end

  def dequeue
    # raise NotImplementedError, "Not yet implemented"
    if @front == @back
      raise ArgumentError, "Queue is empty!"
    end
    if element = @store[@front]
      @front = (@front + 1) % @store.length
      return element
    end
  end

  def front
    # raise NotImplementedError, "Not yet implemented"
    return @store[@front]
  end

  def size
    # raise NotImplementedError, "Not yet implemented"
    return @store.length
  end

  def empty?
    # raise NotImplementedError, "Not yet implemented"
    if @front == @back
      return true
    else
      return false
    end
  end

  def to_s
    # return @store.to_s
    queue = []
    until @front == @back
      queue << @store[@front]
      @front = (@front + 1) % @store.length
    end
    return queue.to_s
  end
end
