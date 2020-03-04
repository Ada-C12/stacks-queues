class Queue
  
  def initialize
    @store = Array.new(50)
    @front = -1
    @back = -1
  end
  
  def enqueue(element)
    if((@front == 0 && @back == @store.length - 1) || (@front == @back + 1))
      raise ArgumentError
    elsif @front == -1 && @back == -1
      @front = 0
      @back = 0
    end
    
    @store[@back] = element
    @back = (@back + 1) % @store.length
  end
  
  def dequeue
    if @front == -1
      raise ArgumentError
    end
    
    data = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length
    
    if @front == @back
      @front = -1
      @back = -1
    end
    
    return data
  end
  
  def front
    return @store[@front]
  end
  
  def size
    if self.empty?
      raise ArgumentError
    end
    
    return @back - @front
  end
  
  def empty?
    if @front == -1 && @back == -1
      return true
    else
      return false
    end
  end
  
  def to_s
    return @store[@front...@back].to_s
  end
end

# q = Queue.new
# q.enqueue(0)
# q.enqueue(1)
# q.enqueue(2)
# q.enqueue(3)
# p q
# p q.size
# p q.dequeue
# p q.size
# p q.front