require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  return true if string.length == 0
  
  open_parens = ["[","{","("] 
  closed_parens = ["]","}",")"] 

  stack = Stack.new

  string.each_char do |element|
    if open_parens.include?(element)
      stack.push(element)
    elsif closed_parens.include?(element)
      position = closed_parens.index(element)
      if !stack.empty? && open_parens[position] == stack[(stack.length-1)]
        stack.pop 
      elsif 
        stack.empty?
      else
        return false
      end
    end
  end

end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
