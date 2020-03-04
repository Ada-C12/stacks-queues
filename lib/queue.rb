class Queue
  def initialize
    @store = Array.new(10)

    @front = -1
    @back = -1
  end

  def enqueue(element)
    # Queue is empty
    if @front == -1
      @front = 0
      @back = 0

    # Queue is full
    elsif @front == @back
      length = @store.length
      new_array = Array.new(length * 2)

      write = 0
      read = @front

      while read < length
        new_array[write] = @store[read]
        read += 1
        write += 1
      end

      read = 0

      while write < length
        new_array[write] = @store[read]
        read += 1
        write += 1
      end

      @store = new_array
      @front = 0
      @back = length
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    data = @store[@front]
    @front = (@front + 1) % @store.length

    if @front == @back
      @front = -1
      @back = -1
    end
    
    return data
  end

  def front
    return @store[@front]
  end

  def size
    if @back > @front
      return @back - @front
    elsif @front == @back
      if @front == -1
        return 0
      else
        return @store.length
      end
    else
      return (@store.length - @front) + @back
    end
  end

  def empty?
    return @front == -1
  end

  def to_s
    if @back >= @front
      return @store[@front...@back].to_s
    else
      queue = @store[@front..-1] + @store[0...@back]
      return queue.to_s
    end
  end
end
