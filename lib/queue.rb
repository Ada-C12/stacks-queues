class Queue

  def initialize
    # first in, first out, like a check-out line
    @store = Array.new(20)
    # pointers to @store nodes
    @front = @back = -1
  end

  def enqueue(element)
    # if empty then add element node to index 0 
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    end
    # if queue is full
    if @front == ((@back + 1) % @store.length) 
      return nil
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
    return @store[@back]
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
    # from front to end
    if @front < @back
      @store = @store[@front...@back]
    # from back to end, then start to front
    else
      @store = @store[@back..-1] + @store[0...@front]
    end
    return @store.to_s
  end
end
