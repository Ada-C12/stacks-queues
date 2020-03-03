require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  stack = Stack.new
  pairs = {
    ')'=> '(',
    '}'=> '{',
    ']'=> '['
  }

  string.each_char do |char|
    if pairs.values.include?(char)
      stack.push(char)
    else
      return false if stack.empty?
      removed = stack.pop
      return false unless removed == pairs[char]
    end
  end

  stack.empty? ? true : false
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
