class Queue
  def initialize
    @store = Array.new(100)
    @front = 0
    @back = 0
  end

  def enqueue(element)
    @store[@back] = element
    @back = (@back + 1) % @store.size
  end

  def dequeue
    element = front
    return unless element
    @store[@front] = nil
    @front = (@front + 1) % @store.size
    return element
  end

  def front
    @store[@front]
  end

  def size
    @store.compact.size
  end

  def empty?
    @store.compact.empty?
  end

  def to_s
    return @store.compact.to_s
  end
end
