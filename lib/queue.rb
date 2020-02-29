class Queue

  def initialize(capacity = 100)
    @store = Array.new(capacity)
    @start = -1
    @end = -1
  end

  def enqueue(element)
    if @start == -1 && @end == -1
      @start = 0
      @end = 1
    end
    
    raise StandardError, "Queue is full"if @start == @end

    @store[@end] = element
    @end = (@end + 1) % @store.size
    @start = (@start + 1) % @store.size if @store[@start].nil?
  end

  def dequeue
    element = nil
    if !empty?()
      element = @store[@start]
      @store[@start] = nil
      @start = (@start + 1) % @store.size
    end
    return element
  end

  def front
    return @store[@start]
  end

  def size
    return @store.compact.size
  end

  def empty?
    return (size() == 0)
  end

  def to_s
    queue = []
    if @store[@start]
      current_index = @start
      while current_index != @end
        queue << @store[current_index]
        current_index = (current_index + 1) % @store.size
      end
    end
    return queue.to_s
  end
end
