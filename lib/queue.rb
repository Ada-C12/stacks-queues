class Queue

  def initialize
    # first in, first out, like a check-out line
    @store = Array.new(19)
    # pointers to @store nodes
    @front = @back = -1
  end

  def enqueue(element)
    # if empty then add element node to index 0 
    if @front == -1 && @back == -1
      puts "setting front and back to 0"
      @front = 0
      @back = 0
    end
    # if queue is full
    if @front == @back && !@store[@front].nil?
      puts "adding #{element}, queue will be full"
      puts "(@front: #{@front}, @back: #{@back}"
    end
    puts "adding #{element} to @back located at index #{@back}"
    puts "@front: #{@front}"
    @store[@back] = element
    @back = (@back + 1) % @store.length
    puts "moved @back to #{@back}"
    return element
  end

  def dequeue
    # if empty return nil
    if @front == -1 && @back == -1
      return nil
    end
    # if queue is not empty return the first element in the list (at front)
    # and remove it from queue
    dequeued = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % @store.length
    # if it was the last one, set front and back to -1
    if @front == @back && @store[@back].nil?
      puts "it was the last one, resetting queue"
      @front = @back = -1
    end
    puts "removed #{dequeued} from queue, @front: #{@front}, @back: #{@back}"
    return dequeued
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    # from front to end
    if @front < @back
      size = @store[@front...@back].length
    # from back to end, then start to front
    else
      size = @store[@back..-1] + @store[0...@front]
    end
    return size
  end

  def empty?
    return @front == @back && @back == -1
  end

  def to_s
    # from front to end
    if @front < @back
      print_store = @store[@front...@back]
    # from front to end, then 0 to back
    else
      print_store = @store[@front..-1] + @store[0...@back]
    end
    puts "front and back:"
    puts @front
    puts @back
    puts "actual @store:"
    puts @store.to_s
    return print_store.to_s
  end
end
