class Stack
  def initialize
    @store = Array.new(10)
    @front = -1
    @back = -1
  end

  def push(element)
    
  end

  def pop
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    raise NotImplementedError, "Not yet implemented"
  end

  def to_s
    return @store.to_s
  end
end
