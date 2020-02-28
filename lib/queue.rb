class Queue
  attr_reader :front, :back
  def initialize
    @store = Array.new()
    @front = -1
    @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    elsif @front == @back
      @back = @store.length
    end

    @store[@back] = element
    @back = (@back + 1) % size
    
    return @store
  end

  def dequeue
    return @store[@front] if empty?
    
    @store.pop
    
    if @front == @back
      @front = -1
      @back = -1
    else
      @back -= 1
    end

    return @store[@front]
  end

  def front
    return nil if @front == -1 && @back == -1
    return @front
  end

  def size
    return @store.length
  end

  def empty?
    return true if @front == -1 && @back == -1
    return false
  end

  def to_s
    return @store.to_s
  end
end
