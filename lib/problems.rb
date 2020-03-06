require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  return true if string.length == 0

  return false if string.length % 2 == 1

  open_parens = ["[","{","("] 
  closed_parens = ["]","}",")"] 

  stack = Stack.new

  string.each_char do |element|
    if open_parens.include?(element)
      stack.push(element)
    elsif closed_parens.include?(element)
      data = stack.pop 
      if open_parens.find_index(data) != closed_parens.find_index(element)
        return false
      end
    end
  end
  return true
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
