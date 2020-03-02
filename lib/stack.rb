class Stack
  def initialize
    @store = []
  end

  def push(element)
    @store << element
  end

  def pop
    @store.pop()
  end

  def empty?
    return @store.length == 0
  end

  def to_s
    return @store.to_s
  end
end
