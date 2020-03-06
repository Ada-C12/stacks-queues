class Queue

  def initialize
    @store = Array.new(10)
    @size = 10
    @front = -1
    @front = -1
  end

  def enqueue(element)
    if @front == -1
      @front = 0
      @back = 1
      @store[@front] = element 
    elsif @front == @back
      raise ArgumentError, "This queue is full"
    else
      @store[@back] = element
      @back = (@back + 1) % @size
    end
  end

  def dequeue
    if @front == -1
      raise ArgumentError, "This queue is empty"
    else
      value = @store[@front]
      @front = (@front + 1) % @size
      if @front == @back 
        @front = -1
        @back = -1
      end
      return value
    end
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return @front == -1
  end

  def to_s
    list = []
    current = @front
    until curent == @back
      list << @store[current]
      current = (current + 1) % @size
    end
    return list.to_s
  end
end
