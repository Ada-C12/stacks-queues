class Queue

  def initialize
    @store = Array.new()
    @front = @back = -1
  end

  def enqueue(element)
    puts "\n#{self}"

    # if queue is full, either raise error OR make queue bigger, in this case the test wants the queue to incr size

    if @front == -1 && @back == -1
      # if empty queue
      @front = 0
      @back = 0
    elsif (@front== 0 && @back == @store.length-1) 
      # queue is full, @back is on index -1, so just add new one onto the end
      @back += 1 
    elsif (@back + 1 == @front) 
      # queue is full, but @end has wrapped around so it's not a simple addition onto the end
      temp = @store.slice![@front..@store.length-1]
      
      @back += 1
      @store[@back] << element
      
      @store.concat(temp)
      @front += 1
      return
    else
      # queue has room
      # modulus allows wraparound if needed :-)
      @back = (@back + 1) % @store.length
    end

    @store[@back] = element 
    
    puts "\t->#{self}"
  end

  def dequeue
    puts "\n#{self}"

    # tests also require resizing of queue with every removal
    return nil if self.empty?

    garbage = @store[@front]
    @front = (@front + 1) % @store.length
    
    if (@front == @back)
      #  if @front and @back are at the same index, then queue is empty, reset
      @front = -1
      @back = -1
      @store = []
    elsif @back > @front
      # 1 continuous train, no wraparound
      @store = @store.slice![@front..@back]
    else
      # @front has wrapped around 
      front_half = @store.slice![@front..self.size - 1]
      back_half = @store.slice![0..@back]
      @store = front_half + back_half
      @front = 0
      @end = self.size - 1
    end

    return garbage
  end

  def front
    return @store[@front]
  end

  def size
    return @store.length
  end

  def empty?
    return ((@front == -1) && (@back == -1)) ? true : false
  end

  def to_s
    return @store.to_s
  end
end
