require_relative './stack.rb'
require 'set'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  raise NotImplementedError, "Not implemented yet"
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  result = 0
  if !postfix_expression.empty?
    operator_set = ['+', '-', '*', '/']
    stack = Stack.new()
    postfix_expression.each_char do |char|
      if operator_set.include?(char)
        operand2 = stack.pop
        operand1 = stack.pop 
        return result if operand2.nil? || operand1.nil?

        result = operand1.send(char, operand2)
        stack.push(result)
      else
        stack.push(char.to_i)
      end
    end
  end
  return result
end

