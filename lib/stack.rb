class Stack
  def initialize
    @store = LinkedList.new
  end
  
  def push(element)
    @store.add_last(element)
  end
  
  def pop
    temp = @store.remove_last()
    if !temp
      puts "stack is empty"
    else return temp
    end
  end
  
  def empty?
    return @store.empty?
  end
  
  def to_s
    return @store.to_s
  end
end
