require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n) 
def balanced(string)
  braces_stack = Stack.new
  string.each_char do |n|
    case n 
    when "("
      braces_stack.push(n)
    when "{"
      braces_stack.push(n)
    when "["
      braces_stack.push(n)
    when ")"
      return false if !stack_checker(braces_stack, "(")
    when "}"
      return false if !stack_checker(braces_stack, "{")
    when "]"
      return false if !stack_checker(braces_stack, "[")
    end 
  end 
  return braces_stack.empty? 
end

def stack_checker(stack, expected_paren)
  return !(stack.empty? || stack.pop != expected_paren)
end 

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  stack = Stack.new
  postfix_expression.each_char do |n|
    if /\+|-|\*|\//.match(n)
      stack_operation_helper(stack, stack.pop, stack.pop, n)
    else 
      stack.push(n)
    end 
  end 
  return stack.pop
end

def stack_operation_helper(stack, first_pop, second_pop, operator)
  case operator
  when "+"
    stack.push(second_pop.to_i + first_pop.to_i)
  when "-"
    stack.push(second_pop.to_i - first_pop.to_i)
  when "*"
    stack.push(second_pop.to_i * first_pop.to_i)
  when "/"
    stack.push(second_pop.to_i / first_pop.to_i)
  end 
end 
