require_relative './stack.rb'

# Time Complexity: O(n) because the time the method takes to run will increase linearly with string size. 
# Space Complexity: O(n) because at worst case the stack size could increase linearly with string size, also at worst case the stack trace in memory could increase linearly with string size. 
def balanced(string)
  stack = Stack.new

  balanced_helper(string, stack)
end

def balanced_helper(string, stack)
  return true if string.empty? && stack.empty?

  char = string[0]

  if char == "{" || char == "(" || char == "["
    stack.push(char)

    return balanced_helper(string[1..-1], stack)
  else
    pop_value = stack.pop

    if (pop_value == "{" && char == "}") || (pop_value == "(" && char == ")") || (pop_value == "[" && char == "]")
      return balanced_helper(string[1..-1], stack)
    else
      return false
    end
  end
end

# Time Complexity: O(n) because the time the method takes to run will increase linearly with expression size. 
# Space Complexity: O(n) because at worst case the stack size could increase linearly with expression size, also at worst case the stack trace in memory could increase linearly with expression size. 
def evaluate_postfix(postfix_expression)
  stack = Stack.new

  postfix_helper(postfix_expression, stack)
end

def postfix_helper(expression, stack)
  return stack.pop if expression.empty?

  char = expression[0]

  if char == "+" || char == "-" || char == "/" || char == "*"
    value_two = stack.pop.to_i
    value_one = stack.pop.to_i

    case char
    when "+"
      stack.push(value_one + value_two)
    when "-"
      stack.push(value_one - value_two)
    when "/"
      stack.push(value_one / value_two)
    when "*"
      stack.push(value_one * value_two)
    end
  else
    stack.push(char)
  end

  return postfix_helper(expression[1..-1], stack)
end
