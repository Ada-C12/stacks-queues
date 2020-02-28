class Queue

  def initialize
    @store = Array.new
    @front = @back = -1 # nothing has been set yet so both will be set to -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end
    if @front == @back
      raise ArgumentError.new
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length # but what happens when it reaches the end?
    print "*********#{}"
  end

  def dequeue
    raise NotImplementedError, "Not yet implemented"
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
