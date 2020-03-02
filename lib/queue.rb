class Queue
  
  def initialize
    # how do we know what the size of the queue is going to be?
    @store = Array.new() 
    
    # this has an index of -1 to indicate these are empty
    @front = -1
    @back = -1
    
  end
  
  def enqueue(value)
    if @front == -1 && @back == -1
      @store.push(value)
      @front = 0
      @back = 0
      # this adds a viable index number, because for this part of the "if" statement, the array is empty, both front and back are 0
    else
      @store.push(value)
      @front = 0
      @back += 1
      # this keeps the front pointer at index zero, but increases the back index to reflect the addition of a new element in the array
    end
  end
  
  def dequeue
    puts "I'm the whole thing #{self}"
    puts "I'm the front #{@front}"
    puts "I'm the back #{@back}"
    
    temp = @back
    
    if @back == 0
      
    end
    
    # return temp
    
    # temp = @back
    # @back -= 1
    # self.pop
    # return temp
  end
  
  def front
    raise NotImplementedError, "Not yet implemented"
  end
  
  def size
    raise NotImplementedError, "Not yet implemented"
  end
  
  def empty?
    if @front == -1 && @back == -1
      return true
    else
      return false
    end
  end
  
  def to_s
    return @store.to_s
  end
end
