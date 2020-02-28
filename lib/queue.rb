class Queue

  def initialize
    @store = Array.new(220)
    @front = @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    end

    if @front == @back
      # raise an error
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    element = @store[@front]

    @store[@front] = nil
    @front = (@front + 1) % @store.length

    return element
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return @store.compact.empty? ? true : false
  end

  def to_s
    return @store.compact.to_s
  end
end
