require 'linked_list'

class Stack
  def initialize
    @list = LinkedList.new
  end
  
  def push(element)
    @list.add_last(element)
  end
  
  def pop 
    return nil if @list.empty?
    @list.remove_last
  end
  
  def empty?
    return @list.empty?
  end
  
  def to_s
    return @list.to_s
  end
end
