class Queue
  
  def initialize
    # @store = ...
    @store = Array.new(10)
    @front = -1
    @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0 
    end
    
    if @front == @back && @store.compact.length > 0
      front_array = @store.slice(0, @front)
      back_array = @store.slice(@back, @store.length - 1)
      @store = front_array + Array.new(10) + back_array
      @front = (@front + 10) % @store.length
    end
    
    @store[@back] = element
    @back = (@back + 1) % @store.length
  end
  
  def dequeue
    removed = @store[@front]
    @store[@front] = nil 
    @front = (@front + 1) % @store.length 
    return removed
  end
  
  def front
    return @store[@front]
  end
  
  def size
    return @store.length
  end
  
  def empty?
    if @front == @back 
      return true 
    else 
      return false 
    end
  end
  
  def to_s
    if @front >= @back 
      return (@store[@front..-1] + @store[0...@back]).to_s
    else 
      return @store[@front...@back].to_s
    end
  end
end
