class Queue

  def initialize
    @store = Array.new(50)
    @front = @back = -1
  end

  def enqueue(element)
    # ORIGNAL WAY DONE IN CLASS 
    # if @front == -1 && @back == -1
    #   @front = 0
    #   @back = -1
    # end

    # if @front == @back 
    #   raise ArgumentError.new('Queue is full and theres no waiting list')
    # end 

    # @store[@back] = element 
    # @back = (@back + 1) % @store.length   

    if @back == @store.size - 1 # if queue is full 
      raise ArgumentError.new('Queue is full')
      return
    elsif @store.empty? #if queue is empty 
      @front = @back = 0 
      @store[@back] = element
    else
      @back = (@back + 1) % @store.length 
    end 
    @store[@back] = element
  end

  def dequeue
    if @store.empty?
      return nil
    elsif @front == @back 
      @front = @back = -1
    else
      removed = @store[@front + 1]
      @store[@front+1] = nil
      @front = (@front + 1) % @store.length
    end 

    return removed 
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    return @store.compact.size
  end

  def empty?
    if size == 0 
      return true 
    else 
      return false
    end 
  end

  def to_s
    s_queue = []
    @store.each do |i|
      if !i.nil?
        s_queue << i 
      end 
    end 
    return s_queue.to_s
  end
end
