class Queue
  def initialize
    @store = Array.new(100)
    @front = @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end

    if @front == @back
      raise Error, "Queue is full!"
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length

    if @store[@front].nil?
      @front = (@front + 1) % @store.length
    end
  end

  def dequeue
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end
    if @front == @back
      raise Error.new "Queue is empty!"
    end
    element = @store[@front]
    @front = (@front + 1) % @store.length
    return element
  end

  def front
    return @store[@front]
  end

  def size
    @store.length
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
