class Queue
  
  def initialize
    @store = Array.new(10)
    @front = -1
    @back = -1
  end
  
  def enqueue(element)
    if (@back == ((@front - 1) % (@store.length - 1)))
      data = @store
      old_length = @store.length
      new_array = Array.new(10)
      @store = data[@front..-1] + data[0...@front]
      @front = 0
      @back = old_length - 1
    end
    
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
      @store[@back] = element
    elsif (@back == @store.length - 1 && @front != 0)
      @back = 0
      @store[@back] = element
    else
      @back = @back + 1
      @store[@back] = element
    end
  end
  
  def dequeue
    if @front == -1
      print "Queue is already empty."
    end
    
    data = @store[@front]
    @store[@front] = nil
    
    if @front == @back
      @front = -1
      @back = -1
    elsif @front == (@store.length - 1)
      @front = 0
    else
      @front = @front + 1
    end
    
    return data
  end
  
  def front
    return @front
  end
  
  def size
    @store.length
  end
  
  def empty?
    if @front == -1 && @back == -1
      return true
    else
      return false
    end
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
