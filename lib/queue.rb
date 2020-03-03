class Queue
  
  #when front and back are the same, how do you know when the queue is full or empty? depends on the operation you just did. consider changing both to -1 if the array is empty after dequeueing.
  
  def initialize
    @store = Array.new(10)
    @front = 0
    @back = 0
  end
  
  def enqueue(element)
    #resize if the array is full
    if @front == @back + 1 % @store.length
      temp = Array.new(@store.length + 1) 
      @store.each { |n| temp << n }
      @store = temp
      puts "new array is #{@store.to_s}"
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
    @store.each do |n|
      temp << n if n
    end 
    return "#{temp}"
  end
end
