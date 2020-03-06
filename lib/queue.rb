class Queue

  def initialize
    @store = Array.new(50)
    @front = @back = -1
  end

  def enqueue(element)
    if @front == -1
      @front = 0
      @back = 1
      @store[@front] = element
    elsif @front == @back
      raise ArgumentError
    else
      @store[@back] = element
      @back = (@back + 1 ) % @store.length
    end
  end

  def dequeue #remove and return from front
    if @front == -1
      raise ArgumentError
    else
      element = @store[@front]
      @front = (@front + 1) % @store.length
    end

    if @front == @back
      @front = @back = -1
    end

    return element
  end

  def front
    @store[@front]
  end

  def size
    @back - @front
  end

  def empty?
    if @front == @back
      return true
    end
  end

  def to_s
    # @store.delete(nil)
    # return @store.to_s
    list = []
    current = @front
    while current != @back
      list << @store[current]
      current = (current + 1) % @store.length 
    end
    return list.to_s
  end
end
