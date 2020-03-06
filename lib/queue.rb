class Queue
  
  def initialize
    @store = Array.new(10)
    @front = @back = -1
  end
  
  def enqueue(element)
    # if queue is full, either raise error OR make queue bigger, in this case the test wants the queue to incr size
    
    if @front == -1 && @back == -1
      # if empty queue
      @front = 0
      @back = 0
    elsif ((@back + 1) % self.size) == @front
      # queue is full, double existing size
      blankArray = Array.new(self.size)
      if @back == self.size + 1
        # simple addition onto the end
        @back += 1
        @store = @store.concat(blankArray)
      else
        # queue is full, but @end has wrapped around so it's not a simple addition onto the end
        temp = @store.slice!(@front..@store.length-1)
        
        @back += 1
        @store[@back] = element
        
        @store.concat(temp)
        @front += 1
        return
      end
    else
      # queue has room
      # modulus allows wraparound if needed :-)
      @back = (@back + 1) % @store.length
    end
    
    @store[@back] = element 
  end
  
  def dequeue
    # return nil if self.empty?   # ok this line is funky, idk what i was thinking, it doesn't really do antyhing
    if @front == -1
      raise ArgumentError, "Queue Empty"
    end
    
    garbage = @store[@front]
    # I didn't bother resetting @store[@front] to nil
    
    if (@front == @back)
      #  if @front and @back are at the same index, then queue will be empty after dequeuing, reset
      @front = -1
      @back = -1
    else
      @front = (@front + 1) % @store.length
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
    
    return "[]" if self.empty?
    return "[#{@store[0]}]" if (@front == @back)
    
    printout = "["
    
    currIndex = @front 
    until currIndex == @back
      printout += "#{@store[currIndex]}, "
      
      # advance index for next loop
      currIndex = (currIndex + 1) % self.size
    end
    
    printout << "#{@store[@back]}]"
    return printout
  end
end

# rake passed all tests, so i'm ok?  My code tends to be longwinded though