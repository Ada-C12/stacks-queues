
class Queue
  def initialize
    @store = Array.new(10)
    @front = @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end
    if @front == @back
      raise ArgumenetError
    end
    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    if @front == -1
      raise ArgumenetError
    elsif @front == @back
      @front = -1
      @back = -1
    else
      first = @store[@front]
      @store[@front] = nil
      @front = (@front + 1) % @store.length
    end
   
    return first
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return true if @front = -1 && @back - 1
  end

  def to_s
    return @store[@front + 1...@back].to_s
  end
end
