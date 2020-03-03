require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  close = {
    "(" => ")",
    "[" => "]",
    "{" => "}"
  }

  stack = Stack.new

  string.each_char do |char|
    if close.keys.include?(char)
      stack.push(char)
    elsif close.values.include?(char)
      return false if stack.empty?
      element = stack.pop
      return false if char != close[element]
    end
  end

  return stack.empty? 
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
