class Queue

  def initialize
    @store = Array.new(10)
    @front = @back = -1
  end

  def enqueue(element)
    @front = 0 && @back = 0 if @front == -1 && @back == -1
    raise StandardError.new "Queue is full" if ((@back + 1) % @store.length) == @front

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    raise StandardError.new "Queue is empty" if @front == @back

    temp = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length
  end

  def front
    return @store[@front]
  end

  def size
    return @store.compact.size
  end

  def empty?
    return true if @front == @back
    return false
  end

  def to_s
    if @back >= @front
      return @store[@front...@back].to_s
    else
      queue = @store[@front..-1] + @store[0...@back]
      return queue.to_s
    end
  end
end
