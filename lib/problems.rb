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
        stack.pop()
        stack_length -= 1
      else 
        return false
      end
    end
    
    i += 1
  end
  
  return stack.empty?
end

# Time Complexity: O(n) - where n is the amount of characters in the expression
# Space Complexity: O(n) - where n is the number of digits in the expression
def evaluate_postfix(postfix_expression)
  stack = Stack.new()
  return nil if postfix_expression.empty?

  # This solution would not work for floats
  postfix_expression.each_char do |char|
    if char.match?(/\d/)
      stack.push(char)
    elsif char.match?(/[*-\/+]/)
      val_1 = stack.pop().to_i
      val_2 = stack.pop().to_i
      result = nil

      case char
      when '*'
        result = val_1 * val_2
      when '-'
        result = val_2 - val_1
      when '/'
        result = val_2 / val_1
      when '+'
        result = val_1 + val_2
      end

      stack.push(result)
    else
      raise StandardError.new "Invalid character #{char}."
    end
  end

  return stack.pop()
end
