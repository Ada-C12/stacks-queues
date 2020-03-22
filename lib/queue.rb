class Queue
  
  def initialize
    @store = Array.new(100)
    @front = -1
    @back = -1
  end
  
  def enqueue(element)
    if (@front == 0 && @back == @store.length - 1) || (@back == ((@front - 1) % (@store.length - 1)))
      raise ArgumentError, "Queue is full."
    elsif (@front == -1)
      @front = 0
      @back = 0
      @store[@back] = element
    elsif (@back == @store.length - 1 && @front != 0)
      @back = 0
      @store[@rear] = element
    else
      @back = @back + 1
      @store[@back] = element
    end
  end
  
  def dequeue
    if (@front == -1)
      raise ArgumentError, "Queue is empty"
    end
    
    data = @store[@front]
    @store[@front] = NotImplementedError
    
    if (@front == @back)
      @front = -1
      @back = -1
    elsif (@front == (size - 1))
      @front = 0
    else
      @front = @front + 1
    end
    
    return data
  end
  
  def front
    return @store[@front]
  end
  
  def size
    return @store.length
  end
  
  def empty?
    # return @store.empty?
    if @front == -1 && @back == -1
      return true
    else
      return false
    end
  end
  
  def to_s
    # return @store.to_s
    to_print = []
    pointer = @front
    while pointer != @back + 1
      to_print << @store[pointer]
      pointer = (pointer + 1) % (size)
    end
    return to_print.to_s
  end
end
