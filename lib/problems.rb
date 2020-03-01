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

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
