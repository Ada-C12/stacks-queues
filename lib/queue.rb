# Wave 2
# require_relative './stack.rb'
require "./linked_list"

class Queue

  def initialize
    @store = LinkedList.new
    @front = @back = -1
# @front = -1
# @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    end

    if @front == @back
      raise ArgumentError.new("Error")
    end

    return @store.add_last(element)

  end

  def dequeue
    # if @front == -1 && @back == -1
    #   @front = 0
    #   @back = 1
    # end
 
    if @store.length > 0
      return @store.remove_first()
    end
 
    # puts @store
    # puts @front
    # puts @back

  end

  def front
    # raise NotImplementedError, "Not yet implemented"
    return @store.get_first()
  end

  def size
    # raise NotImplementedError, "Not yet implemented"
    return @store.length
  end

  def empty?
    # raise NotImplementedError, "Not yet implemented"
    # return true if @front == @back
    return @store.empty?

  end

  def to_s
    return @store.to_s
  end
end
