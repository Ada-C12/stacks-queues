class Queue

  def initialize(size = 10)
    @store = Array.new(size)
    @front = 0
    @back = 0

    @is_empty = true
  end

  def enqueue(element)
    if @front == @back && !@is_empty
      raise ArgumentError, "Queue is full"
    end

    @is_empty = false if @is_empty
    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    removed_value = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length

    @is_empty = true if @front == @back 

    return removed_value
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return @is_empty
  end

  def to_s
    return @store.to_s
  end
end
