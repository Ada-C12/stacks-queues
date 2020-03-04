class Queue

  def initialize
    @store = Array.new(100)
    @front = @back = -1 # nothing has been set yet so both will be set to -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    end

    if ((@back + 1) % @store.length) == @front
      raise StandardError.new
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length # but what happens when it reaches the end?
  end

  def dequeue
    element = @store[@front]
    @store[@front] = nil
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
    return true if @front == @back
    return false
  end

  def to_s
    # @front = (@front) % @store.length
    # @back = (@back) % @store.length
    if @front < @back
      @store = @store[@front...@back]
    else
      @store = @store[@back...@front]
    end

    return @store.to_s
  end
end
