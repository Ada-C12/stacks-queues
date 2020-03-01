class Queue
  
  def initialize
    @store = Array.new(10)
    @front = -1
    @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end
    
    if @front == @back
      return
    end
    
    @store[@back] = element
    @back = (@back + 1) % @store.length
  end
  
  def dequeue
    if @front == -1 && @back == -1
      print "Queue is already empty."
    end
    
    @store[@front] = nil
    
    if @front == @back
      @front = -1
      @back = -1
    elsif @front == (@store.length - 1)
      @front = 0
    else
      @front = @front + 1
    end
    
    return @store[front]
  end
  
  def front
    return @front
  end
  
  def size
    @store.length
  end
  
  def empty?
    return @store.length > 0
  end
  
  def to_s
    values = []
    
    @store.each do |i|
      if !i.nil?
        values << i
      end
    end
    
    return values.to_s
  end
end
