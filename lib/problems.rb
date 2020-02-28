require_relative "./stack.rb"

# Time Complexity: O(n) n represents each character
# Space Complexity: O(n) because we're pushing parentheses onto a stack
def balanced(string)
  stack = []
  parens = { "(" => ")", "{" => "}", "[" => "]" }

  string.each_char do |c|
    if parens[c]
      stack.push(c)
    elsif parens[stack.pop] != c
      return false
    end
  end
  stack.empty?
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
