require_relative './stack.rb'

# Time Complexity: O(n), where n is a character in the string
# Space Complexity: O(n), where n is a character in the string,
#                   because if there were no matches, I would add every character to the stack.
def balanced(string)
  parens_key = {
    ")": "(",
    "]": "[",
    "}": "{",
  }
  is_balanced = true

  history = Stack.new()
  string.each_char do |char|
    if history.empty?
      history.push(char)
    else
      preceeding = history.pop()
      if preceeding != parens_key[char.to_sym]
        history.push(preceeding)
        history.push(char)
      end
    end
  end

  if !history.empty?
    is_balanced = false
  end
  return is_balanced
end

# Time Complexity: O(n) where n is a character in the postfix_expression
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  operators = Set.new(['+', '-', '*', '/'])
  history = Stack.new()
  postfix_expression.each_char do |char|
    if !operators.include?(char)
      history.push(char)
    else
      second_operand = history.pop().to_i
      first_operand = history.pop().to_i
      # syntax from https://stackoverflow.com/a/20019672
      result = first_operand.method(char).(second_operand)
      history.push(result)
    end
  end
  return history.pop()
end
