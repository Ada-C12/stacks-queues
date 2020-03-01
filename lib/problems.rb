require_relative './stack.rb'

# Time Complexity: O(n) - where n is length of the string; worse case will have to traverse the entire string, but stack should never be longer than half the size of the string
# Space Complexity: O(n) - where n is length of string; stack will get larger as string gets larger
def balanced(string)
  return false if string.length.odd?
  return true if string.empty?
  
  symbol_pairs = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }
  
  stack = Stack.new()
  stack_length = 0
  i = 0
  until i == string.length || stack_length > (string.length / 2)
    current = string[i]
    
    case current
    when '(', '[', '{'
      # O(n) time complexity
      stack.push(current)
      stack_length += 1
    else
      # O(n) time complexity
      if stack.get_last() == symbol_pairs[current]
        stack.pop
        stack_length -= 1
      else 
        return false
      end
    end
    
    i += 1
  end
  
  return stack.empty?
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
