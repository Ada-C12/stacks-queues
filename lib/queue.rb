class Queue
  attr_reader :front, :back, :store
  def initialize
    @store = Array.new(20)
    @front = -1
    @back = -1
  end

  def enqueue(element)
    if empty?
      @front = 0
      @back = 0
    elsif @front == @back
      # do something
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    return nil if empty?
    
    removed = @store[@front]
    @store[@front] = nil

    if @back - 1 == @front
      @front = -1
      @back = -1
    else
      @front = (@front + 1) % @store.length
    end
    return removed
  end

  def front
    return nil if empty?
    return @front
  end

  def size
    return 0 if empty?
    return @front - @back if @front > @back
    return @back + (@store.length - @front)
  end

  def empty?
    @front == -1 && @back == -1
  end

  def to_s
    return [] if empty?
    return @store.compact.to_s if @front < @back

    output = []
    i = @front
    until i > @store.length - 1 
      output << @store[i]
      i += 1
    end

    i = 0
    until @store[i].nil? || i == @front
      output << @store[i]
      i += 1
    end

    return output
  end
end
