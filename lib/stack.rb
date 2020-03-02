class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element
  end

  def pop
    top_element = @store[-1]
    @store.delete_at(-1)

    return top_element
  end

  def empty?
    if @store.length == 0
      return true
    else
      return false
    end
  end

  def to_s
    return @store.to_s
  end
end

# USING LINKED LIST
# class Stack
#   def initialize
#     @store = LinkedList.new
#   end

#   def push(element)
#     @store.add_front(element)
#   end

#   def pop
#     return nil if self.empty?

#     element = store.remove_front
#     return element
#   end

#   def empty?
#     return @store.empty?
#   end

#   def to_s
#     return @store.to_s
#   end
# end
