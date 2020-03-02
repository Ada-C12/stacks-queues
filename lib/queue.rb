# Wave 2
# require_relative './stack.rb'
require "./linked_list"

class Queue

  def initialize
    # raise NotImplementedError, "Not yet implemented"
    @store = Array.new
    @front = @back = -1
# @front = -1
# @back = -1
  end

  def enqueue(element)
    # raise NotImplementedError, "Not yet implemented"
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
    #  @front = 0
    #  @back = 1
    end

    if @front == @back
      # raise ArgumentError.new("Error")
    end

    @store[@front] = element
    @front = (@back + 1) % @store.length + 1
    @back =  @front + 1 #(@back + 1) % @store.length + 1

  end

  def dequeue
    # raise NotImplementedError, "Not yet implemented"
    # if @front == -1 && @back == -1
    #   @front = @back = 1
    # end
    
    # if @front == @back
    #   # raise ArgumentError.new("Error")
    # end
    # puts @store
    # puts @front
    # puts @back
    return @store.delete_at(@back)
  end

  def front
    # raise NotImplementedError, "Not yet implemented"
    return @store[@front]
  end

  def size
    # raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    # raise NotImplementedError, "Not yet implemented"
    return true if @front == -1 && @back == -1

  end

  def to_s
    return @store.to_s
  end
end
