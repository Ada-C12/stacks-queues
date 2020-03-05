class Queue
  def initialize
    @store = Array.new(10)
    @front = @back = -1
  end

  def enqueue(element)
    if @front == -1 && @back == -1
      @front = @back = 0
    elsif @front == @back
      length = @store.length
      new_length = length * 2

      new_queue = Array.new(new_length)
      curr = 0
      until curr == @front
        new_queue[curr] = @store[curr]
        curr += 1
      end

      remaining = length - @front
      begin_remaining = new_length - remaining
      until curr == begin_remaining
        curr += 1
      end

      remaining_start_index = @front
      while curr < new_length
        new_queue[curr] = @store[remaining_start_index]
        curr += 1
        remaining_start_index += 1
      end

      @store = new_queue
      @front = begin_remaining
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    item = @store[@front]
    @store[@front] = nil
    if self.empty?
      @front = @back = -1
    else
      @front = (@front + 1) % @store.length
    end
    return item
  end

  def front
    return @store[@front]
  end

  def size
    return @store[@front...@back].length
  end

  def empty?
    @store.each do |item|
      if !item.nil?
        return false
      end
    end
    return true
  end

  def to_s
    if @front >= @back
      front_half = @store[@front..]
      back_half = @store[0...@back]
      full = front_half.concat(back_half).to_s
      return full
    else
      return @store[@front...@back].to_s
    end
  end
end
