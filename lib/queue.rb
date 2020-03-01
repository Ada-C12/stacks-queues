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
      raise StandardError.new "Cannot add element. Queue is full."
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
    return @store[@front]
  end

  def size
    length = 0

    if @back > @front
      length = (@back - @front) + 1
    elsif @front > @back
      length = @store.length - @front
      i = 0

      until @store[i] == nil
        length += 1
        i += 1
      end
    end

    return length
  end

  def empty?
    return @store.compact.empty? ? true : false
  end

  def to_s
    return @store.compact.to_s
  end
end
