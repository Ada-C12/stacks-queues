class Stack
  def initialize
    @store = []
  end

  def push(element)
    @store << element
  end

  def pop
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return true if @store.empty?
    return false
  end

  def to_s
    return @store.to_s
  end
end
