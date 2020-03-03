class Queue

  def initialize
    @store = Array.new(30)
    @front = @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    end

    if ((@back + 1) % @store.length) == @front
      raise ArgumentError.new "Queue is full"
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    if @front == @back
      raise ArgumentError.new "Queue is full"
    end

    temp = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length
    return temp
  end

  def front
    return @store[@front]
  end

  def size
    if @back.length > @front.length
      return @back.length - @front.length
    else
      return @front.length - @back.length
    end
  end

  def empty?
    @front == @back? true : false
  end

  def to_s
    if @front < @back
      @store = @store[@front...@back]
    elsif @front != @back
      @store = @store[@back..-1] + @store[@front...@back]
    end
    return @store.to_s
  end
end
