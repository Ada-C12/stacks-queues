class Queue
  class QueueTooSmallError < StandardError
  end

  def initialize
    @store = Array.new(10)
    @front = @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = @back = 0
    elsif @front == @back
      raise QueueTooSmallError, "Queue is too small"
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    item = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length
    return item
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    @store.each do |item|
      if !item.nil?
        return false
      end
    end
    return true
  end

  def to_s
    puts @store.to_s
    return @store[@front...@back].to_s
  end
end
