require_relative '../lib/stack'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  return false if string.length.odd?
  closings = {
    "[" => "]",
    "(" => ")",
    "{" => "}",
  }
  
  stack = Stack.new

  i = 0
  until i > string.length - 1 do
    if i < string.length / 2
      stack.push(string[i])
    else
      removed = stack.pop
      return false if closings[removed] != string[i]
    end
    i += 1
  end
  return true
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
