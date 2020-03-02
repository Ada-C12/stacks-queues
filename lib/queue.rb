require_relative 'linked_list'

class Queue

  def initialize
    @store = Array.new(100)
    @front = @back = -1
    @counter = 0
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = 0
      @back = 0
    end

    # if @front == @back
    #   raise NoSpaceError
    # end

    @counter += 1
    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    #Decrease front
    if @front == -1 
      raise QuequeEmptyError
    end

    @counter -= 1
    data = @store[@front] 
    @store[@front] = nil

    if @front == @back
      @front = -1
      @back = -1
    elsif @front == (@store.length - 1)
      @front = 0
    else
      @front = @front + 1
    end

    return data
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    return @counter
  end

  def empty?
    return @counter == 0
  end

  def to_s
    string = "["
    string += @store.filter {|i| i != nil}.join(", ")
    return string + "]"
  end
end
