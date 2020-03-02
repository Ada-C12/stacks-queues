class Queue
  
  def initialize
    @store = Array.new(100)
    @front = -1
    @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    end

    if @front == @back
      #decide
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length

  end
  
  def dequeue
    index = @front
    element = @store[index]
    
    @store[index] = nil

    @front = (@front + 1) % @store.length 
    return element
  end
  
  def front
    return @store[@front]
  end
  
  def size
    return @store.compact.length
  end
  
  def empty?
    @store.compact.empty? ? true : false 
  end
  
  def to_s
    return @store.compact.to_s
  end
end
