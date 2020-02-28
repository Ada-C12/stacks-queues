class Queue
  
  def initialize
    @store = Array.new(100)
    @front = @back = -1
  end
  
  def enqueue(element)
    if @front == -1 && @back == -1
      @front = @back = 0
    end
    if self.empty? || @front != @back
      @store[@back] = element
      @back = (@back + 1) % @store.length
    end
  end
  
  def dequeue
    if !self.empty?
      num = @store[@front]
      @store[@front] = nil
      @front = (@front + 1) % @store.length
      return num
    else
      return nil
    end
  end
  
  def front
    raise NotImplementedError, "Not yet implemented"
  end
  
  def size
    if self.empty?
      return []
    elsif @front < @back
      return @store[@front...@back]
    else
      return @store[0...@back] + @store[@front...@store.length]
    end
  end
  
  def empty?
    return true if @front == -1 && @back == -1
    return @store[@front].nil?
  end
  
  def to_s
    return self.size.to_s
  end
end
