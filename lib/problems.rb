require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  braces = {
    '}' => '{',
    ']' => '[',
    ')' => '('
  }
  
  stack = Stack.new
  
  string.each_char do |char|
    if braces[char]
      right = stack.pop
      if braces[char] != right
        return false
      end
    else
      stack.push(char)
    end
  end
  
  return stack.empty?
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
