class Stack
  
  def initialize
  end
  # def initialize
  #   @store = Array.new()
  #   @top = -1
  #   @bottom = -1
  # end
  
  
  def push(element)
  end
  
  # def push(element)
  
  #   if @top == -1 && @bottom == -1
  #     @top = 0
  #     @bottom += 1
  #     @store[0] = element
  #     return
  
  #   end
  
  #   temporary = Array.new
  #   @bottom += 1
  #   current = 0
  
  #   until current == @bottom do
  #     temporary[current + 1] = @store[current]
  #     current += 1
  #   end
  
  #   temporary[0] = element
  
  #   @store = temporary
  # end
  
  def pop
  end
  
  # def pop
  #   if @top == -1 && @bottom == -1
  #     raise ArgumentError, "No elements in the stack to remove"
  #     return
  #   elsif @top == 0 && @bottom == 0
  #     popped = @store[0]
  #     @top = -1
  #     @bottom = -1
  #     @store.clear
  #     return popped
  #   end
  
  #   popped = @store[0]
  
  #   current = 0
  
  #   temporary = []
  
  #   until current == @bottom do
  
  #     puts "I am store #{@store}"
  #     puts "I am temporary #{temporary}"
  #     puts "I am current #{current}"
  #     puts "I am @bottom #{@bottom}"
  
  #     temporary[current] = @store[current + 1]
  #     current += 1
  
  #     puts "I am temporary #{temporary}"
  #     puts "I am current #{current}"
  #     puts "I am @bottom #{@bottom}"
  
  #   end
  
  #   temporary[current] = @store
  
  #   @store = temporary
  #   @bottom = current
  #   @top = 0
  
  #   return popped
  
  # end
  
  
  def empty?
  end
  
  # def empty?
  #   if @top == -1 && @bottom == -1
  #     return true
  #   else
  #     return false
  #   end
  # end
  
  def to_s
    return @store.to_s
  end
  
end
