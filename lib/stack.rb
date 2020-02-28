class Stack
  def initialize
    @store = []
  end

  def push(element)
    raise NotImplementedError, "Not yet implemented"
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
