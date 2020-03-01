require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
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

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
