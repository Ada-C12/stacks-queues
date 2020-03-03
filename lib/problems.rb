require_relative './stack.rb'
require 'set'

# Time Complexity: O(n) 
# Space Complexity: O(n)
def balanced(string)
  length = string.length
  stack = Stack.new()
  if length > 0
    brackets = {
      '{' => '}',
      '(' => ')',
      '[' => ']',
    }

    stack.push(string[0]) 
    (length - 1).times do |index|
      if brackets[stack.top] && string[index + 1] == brackets[stack.top]
        stack.pop
      else
        stack.push(string[index + 1])
      end   
    end
  end
  return stack.empty?
end

# Time Complexity: O(n)
# Space Complexity: O(n)
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

