class Queue
  
  def initialize()
    @store = Array.new(100)
    @front = 0
    @back = 0
  end
  
  def enqueue(element)
    if (@front == @back) && !front.nil?
      capacity = @store.size
      @store = copy_content(Array.new(capacity*2)) 
      @front = 0
      @back = capacity
    end

    @store[@back] = element
    @back = (@back + 1) % @store.size
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
    return @store[@front]
  end
  
  def size
    return @store.compact.size
  end
  
  def empty?
    return front == nil
  end
  
  def to_s
    queue = copy_content(Array.new(size()))
    return queue.to_s
  end

  private
  def copy_content(new_store)
    if front
      current_index = @front
      queue_size = size()
      queue_size.times do |index|
        new_store[index] = @store[current_index]
        current_index = (current_index + 1) % @store.size
      end
    end
    return new_store
  end
end
