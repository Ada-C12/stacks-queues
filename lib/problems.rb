require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  # is it evenly divided by 2? If yes, then return false
  # equal number of open parans and close parens
  # make a new stack, make balanced = true
  # go through each string using each_char
  # if open parens, push to stack
  # if close parens, check if stack has this match. If yes, pop off match in stack
  # if at end, stack is empty, it is balanced. If parens remains, it is not balanced

  if string.length % 2 == 1
    return false 
  end

  stack = Stack.new

  string.each_char do |char|
    if char == '('
      stack.push '('
    elsif char == ')' && stack.pop != '('
      return false 
    end

    if char == '{'
      stack.push '}'
    elsif char == '}' && stack.pop != '{'
      return false 
    end

    if char == '['
      stack.push '['
    elsif char == ']' && stack.pop != '['
      return false  
    end
  end
  return true
end

# Time Complexity: ?
# Space Complexity: ?
# def evaluate_postfix(postfix_expression)
#   raise NotImplementedError, "Not implemented yet"
# end
