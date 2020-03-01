require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  table = { ')' => '(', '}' => '{', ']' => '[' }
  stack = Stack.new

  string.each_char do |char|
    if table.has_value? char
      stack.push char
    else
      return false unless stack.empty? || table[char] == stack.pop
    end
  end
  
  return stack.empty?
end

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  stack = Stack.new
  
  postfix_expression.each_char do |token|
    if token.match(/[0-9]/)
      stack.push token.to_i
    else
      x = stack.pop
      y = stack.pop
      stack.push y.send(token, x)
    end
  end

  return stack.pop
end
