require_relative './stack.rb'

# Time Complexity: O(n) where n is length of string
# Space Complexity: O(n) where n is length of string
def balanced(string)
  if string.empty?
    return true
  end
  
  bracket_stack = Stack.new
  
  pairs = {
    "{" => "}",
    "(" => ")",
    "[" => "]"
  }
  
  string.each_char do |char| # T: O(n) n = length of string
    if pairs[char]
      bracket_stack.push(char) # S: O(n) n = length of string
    else 
      if char != pairs[bracket_stack.pop]
        return false
      end
    end
  end
  
  if bracket_stack.empty?
    return true
  else 
    return false
  end
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
