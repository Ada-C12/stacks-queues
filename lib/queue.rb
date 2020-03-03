class Queue

  def initialize
    @store = Array.new(100)
    @front = 0
    @rear = 0
  end

    def enqueue(element)
        # if the rear is at the last index position, the queue is full
        return ArgumentError.new( "Index is full") if @rear == @store.length - 1 

        @store[@rear] = element
        @rear = (@rear + 1) % @store.size
        
    end

  def dequeue
    element = front
    if element
        @store[@front] = nil
        @front = (@front + 1) % @store.size
    end
    return element
  end

  def front
    @store[@front]
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return true if @front == -1 && @rear == -1
  end

  def to_s
    return @store.to_s
  end
end
