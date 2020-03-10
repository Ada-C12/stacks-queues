class Queue

  def initialize
    @store = Array.new(220)
    @front = @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    elsif @front == @back
      raise StandardError.new "Cannot add element. Queue is full."
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    # should have checks for queue being empty
    # should check if front & back are the same
    element = @store[@front]

    @store[@front] = nil
    @front = (@front + 1) % @store.length
    @front = @back = -1 if @front == @back

    return element
  end

  def front
    return @store[@front]
  end

  def size
    length = 0

    if @back > @front
      length = (@back - @front) + 1
    elsif @front > @back
      # Get the length from the front to the end and then add 
      # the length from index 0 to @back 
      length = @store.length - @front + @back
    end

    return length
  end

  def empty?
    return @front == -1
  end

  def to_s
    # doesn't account for if values have wrapped around the 
    # array

    return @store.compact.to_s

    ##alternate method
    # list = []
    # current = @front
    # while current != @back
    #   list << @store[current]
    #   current = (current + 1) % @store.length
    # end
    # return list.to_s
  end
end
