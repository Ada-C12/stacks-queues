class Queue
  
  def initialize
    @store = Array.new(10)
    @front = 0
    @back = 0
  end
  
  def enqueue(element)
    #resize if the array is full
    if @front == (@back + 1) % @store.length
      temp = Array.new(@store.length + 1) 
      if @front > @back 
        temp.each_index do |n|
          if n < @front
            temp[n] = @store[n]
          elsif n > @front
            temp[n] = @store[n-1]
          end 
        end 
        @front += 1
      else 
        temp.each_index do |n|
          temp[n] = @store[n]
        end 
      end 
      @store = temp
    end 
    #add the element
    @store[@back] = element
    @back = (@back + 1) % @store.length 
  end
  
  def dequeue
    if @front != @back 
      temp = @store[@front]
      @store[@front] = nil
      @front = (@front + 1) % @store.length
      return temp
    end
  end 
  
  def front
    return @store[@front]
  end
  
  def size
    return abs(@back - @front + 1)
  end
  
  def empty?
    return @front == @back
  end
  
  def to_s
    temp = []
    curr = @front
    until curr == @back
      temp << @store[curr] if @store[curr]
      curr = (curr + 1) % @store.length
    end 
    return "#{temp}"
  end
end
