class Queue

  def initialize
    @store = Array.new(50)
    @front = @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = @back = 0
    end
    # check if queue is full
    if @front == @back
    end

    @store[@back] = element 
    @back = (@back + 1) % @store.length 
  end

  def dequeue #remove and return from front
    if @front == @back
      return "queue is empty"
    end

    data = @store[@front]
    @store[@front] = nil

    if @front == @back
      @front = @back = -1
    elsif @front == @store.length - 1
      @front = 0
    else
      @front += 1
    end

    return data

  end

  def front
  end

  def size
  end

  def empty?
    if @front == @back
      return true
    end
  end

  def to_s
    @store.delete(nil)
    return @store.to_s
  end
end
