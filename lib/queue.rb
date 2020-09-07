class Queue

  def initialize
    @store = Array.new(50)
    @front = @rear = -1 
  end

  def enqueue(element)
    
    if (@rear + 1) % @store.length == @front
      return ArgumentError.new("Queue is full")
    end
 
    if @front == -1 && @rear == -1
      @front = @rear = 0
      @store[@front] = element
    else
      @rear = (@rear + 1) % @store.length
      @store[@rear] = element  
    end

  end

  def dequeue 

    if @front == -1 && @rear == -1
      return ArgumentError.new("Queue is empty")
    end

    element = @store[@front]

    if @front == @rear
      @store[@front] = nil
      @front = @rear = -1
    else
      @store[@front] = nil
      @front = (@front + 1) % @store.length
    end

    return element

  end

  def front
    return @store[@front]
  end

  def size
   
    if @front < @back
      return @back - @front
    else
      return @back - 1 + @store.length - (@front + 1)
    end

  end

  def empty?
    return @front == @rear
  end


  def to_s

    store_arr = []
    temp = @front

    while temp <= @store.length - 1 && !@store[temp].nil?
      store_arr << @store[temp]
      temp += 1
    end

    if @store[temp].nil? && @rear < @front
      temp = 0
      while temp <= @rear
        store_arr << @store[temp]
        temp += 1
      end
    end

    return store_arr.to_s
  end


end