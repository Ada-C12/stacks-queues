require_relative './stack.rb'

# Time Complexity: O(n), push and pop should be O(1) operations since the linked list has both a head and tail pointer
# Space Complexity: O(n) if the string is not balanced and comprised wholly of open brackets, also O(n) if it actually closes
def balanced(string)
  return false if string.length % 2 == 1
  return true if string.length == 0
  
  stack = Stack.new
  
  string.each_char do |char|
    case char
    when "{"
      stack.push("}")
    when "["
      stack.push("]")
    when "("
      stack.push(")")
    when "}"
      return false if stack.pop != "}"
    when "]"
      return false if stack.pop != "]"
    when ")"
      return false if stack.pop != ")"
    else
      return false
    end
  end
  
  return stack.empty?
end

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  return nil if postfix_expression.length == 0
  
  stack = Stack.new
  
  postfix_expression.each_char do |char|
    int_conversion = char.to_i
    if int_conversion > 0
      stack.push(int_conversion)
    elsif int_conversion == 0 && char == "0"
      stack.push(int_conversion)
    else
      postfix_operation(char, stack)
    end
  end
  
  return stack.pop
end

def postfix_operation(operator, stack)
  operand_2 = stack.pop
  operand_1 = stack.pop
  
  case operator
  when "+"
    stack.push(operand_1 + operand_2)
  when "-"
    stack.push(operand_1 - operand_2)
  when "*"
    stack.push(operand_1 * operand_2)
  when "/"
    raise ArgumentError, 'Cannot divide by 0' if (operand_1 == 0 || operand_2 == 0)
    stack.push(operand_1 / operand_2)
  end
end
